module FacileSearch
  class MetaData
    BASE_KEYS = %i(namespace text_field id_field tokenizer).freeze

    attr_reader *BASE_KEYS

    def initialize(namespace: , text_field: , id_field: nil, tokenizer: nil)
      @namespace = namespace.to_s
      @text_field = text_field.to_s
      @id_field = id_field || "id"
      @tokenizer = tokenizer || Tokenizer::NGram.new(2)
    end

    def lock_key
      [namespace, "lock"].join("_")
    end
  end
end

