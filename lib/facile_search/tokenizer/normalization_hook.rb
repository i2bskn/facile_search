module FacileSearch
  class Tokenizer
    module NormalizationHook
      def self.apply(text)
        NKF.nkf("-Wwm0Z1X", text)
      end
    end
  end
end

