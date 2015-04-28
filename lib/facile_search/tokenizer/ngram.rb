module FacileSearch
  module Tokenizer
    class NGram
      def initialize(n)
        @n = n
      end

      def tokenize(strings)
        strings.chars.each_cons(@n).map(&:join)
      end
    end
  end
end

