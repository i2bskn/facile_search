module FacileSearch
  class InvertedIndex
    extend Forwardable

    attr_reader :meta_data

    def_delegators :meta_data, :lock_key, *MetaData::BASE_KEYS

    def initialize(meta_data)
      @meta_data = meta_data
    end

    def indexing(obj)
      tokens = tokenizer.tokenize(obj.public_send(text_field))
      id = obj.public_send(id_field)
      return nil if tokens.size.zero? || !id
      lock = Redis::Lock.new(lock_key)
      begin
        lock.lock do
          values = redis.hmget(namespace, tokens).map {|ids|
            array = deserialize(ids)
            array << id
            serialize(array.uniq)
          }
          redis.hmset(namespace, *tokens.zip(values).flatten(1))
        end
      rescue Redis::Lock::LockTimeout
        raise
      end
    end

    def search(*queries)
      queries.flatten.each_with_object([]) {|query, obj|
        if tokenizer.tokenizable?(query)
          tokens = tokenizer.tokenize(query)
          return [] if tokens.size.zero?
          obj << redis.hmget(namespace, *tokens).map {|value| deserialize(value) }.inject(&:&)
        else
          obj << redis.hscan_each(namespace, match: "*#{query}*")
            .map {|_, value| deserialize(value) }.flatten.uniq
        end
      }.inject(&:&)
    end

    def indexes
      redis.hgetall namespace
    end

    def redis
      @redis ||= Redis.current
    end

    private
      def serialize(obj)
        Oj.dump(obj)
      end

      def deserialize(string)
        string ? Oj.load(string) : []
      end
  end
end

