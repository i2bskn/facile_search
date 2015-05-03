require "spec_helper"

describe FacileSearch::Tokenizer::NormalizationHook do
  let(:hook) { FacileSearch::Tokenizer::NormalizationHook }

  describe "#apply" do
    it { expect(hook.apply("アｲうｅＯkA1２")).to eq("アイうeOkA12") }
  end
end

