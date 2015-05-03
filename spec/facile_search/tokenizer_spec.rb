require "spec_helper"

describe FacileSearch::Tokenizer do
  let(:tokenizer) { FacileSearch::Tokenizer.new }
  let(:hook_mock) { double("hook mock") }

  describe "#tokenizable?" do
    it {
      expect {
        tokenizer.tokenizable?
      }.to raise_error(NotImplementedError)
    }
  end

  describe "#dividing" do
    it {
      expect {
        tokenizer.dividing("some text")
      }.to raise_error(NotImplementedError)
    }
  end

  describe "#preprocess" do
    it {
      expect(hook_mock).to receive(:apply).and_return("edited text")
      tokenizer.add_hook hook_mock
      tokenizer.preprocess("some text")
    }
  end

  describe "#add_hook" do
    it {
      expect {
        tokenizer.add_hook hook_mock
      }.to change { tokenizer.hooks.size }.by(1)
    }
  end

  describe "#hooks" do
    it { expect(tokenizer.hooks).to be_empty }

    it {
      tokenizer.add_hook hook_mock
      expect(tokenizer.hooks).to have_attributes(size: 1)
    }
  end
end

