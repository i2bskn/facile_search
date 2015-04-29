module FacileSearch
  class Tokenizer
    class NGram < self
      def initialize(n = nil)
        @n = n || 2 # default is bigram
      end

      def tokenizable?(text)
        text.size >= @n
      end

      def dividing(text)
        text.chars.each_cons(@n).map(&:join)
      end
    end
  end
end

