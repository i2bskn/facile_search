require "facile_search/tokenizer/ngram"

module FacileSearch
  class InvertedIndex
    extend Forwardable

    attr_reader :meta_data

    def_delegators :meta_data, :lock_key, *MetaData::BASE_KEYS

    def initialize(meta_data)
      @meta_data = meta_data
    end

    def indexing(obj)
      tokens = tokenizer.tokenize(obj.public_send(text_key))
      id = obj.public_send(id_key)
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

    def search(queries)
      queries.each_with_object([]) {|query, obj|
        tokens = tokenizer.tokenize(query)
        return [] if tokens.size.zero?
        obj << redis.hmget(namespace, *tokens).map {|ids| deserialize(ids) }.inject(&:&)
      }.inject(&:&)
    end

    private
      def serialize(obj)
        Oj.dump(obj)
      end

      def deserialize(string)
        string ? Oj.load(string) : []
      end

      def redis
        @redis ||= Redis.current
      end
  end
end
