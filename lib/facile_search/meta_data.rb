module FacileSearch
  class MetaData
    BASE_KEYS = %i(namespace text_key id_key tokenizer).freeze

    attr_reader *BASE_KEYS

    def initialize(namespace: , text_key: , id_key: nil, tokenizer: nil)
      @namespace = namespace.to_s
      @text_key = text_key.to_s
      @id_key = id_key || "id"
      @tokenizer = tokenizer || Tokenizer::NGram.new(2)
    end

    def lock_key
      [namespace, "lock"].join("_")
    end
  end
end

