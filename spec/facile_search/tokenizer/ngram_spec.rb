require "spec_helper"

describe FacileSearch::Tokenizer::NGram do
  let(:bigram) { FacileSearch::Tokenizer::NGram.new(2) }

  it { expect(bigram.instance_eval { @n }).to eq(2) }

  describe "#tokenizable?" do
    it { expect(bigram.tokenizable?("a")).to be_falsey }
    it { expect(bigram.tokenizable?("ab")).to be_truthy }
  end

  describe "#dividing" do
    it { expect(bigram.dividing("hello")).to eq(["he", "el", "ll", "lo"]) }
    it { expect(bigram.dividing("i")).to be_empty }
  end
end

