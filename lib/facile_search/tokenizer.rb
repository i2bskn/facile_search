require "facile_search/tokenizer/ngram"
require "facile_search/tokenizer/normalization_hook"

module FacileSearch
  class Tokenizer
    def tokenize(text)
      dividing(preprocess(text))
    end

    def tokenizable?(text)
      raise NotImplementedError
    end

    def dividing(text)
      raise NotImplementedError
    end

    def preprocess(text)
      hooks.inject(text) {|txt, hook| hook.apply(txt) }
    end

    def add_hook(hook)
      hooks << hook
    end

    def hooks
      @hooks ||= []
    end
  end
end

