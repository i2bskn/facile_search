require "spec_helper"

describe FacileSearch::Tokenizer::NGram do
  let(:bigram) { FacileSearch::Tokenizer::NGram.new(2) }

  it { expect(bigram.instance_eval { @n }).to eq(2) }
  it { expect(bigram.tokenize("hello")).to eq(["he", "el", "ll", "lo"]) }
  it { expect(bigram.tokenize("i")).to be_empty }
end

