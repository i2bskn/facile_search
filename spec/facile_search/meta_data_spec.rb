require "spec_helper"

describe FacileSearch::MetaData do
  let(:namespace) { "sample" }
  let(:meta_data) { FacileSearch::MetaData.new(namespace: namespace, text_field: "text") }

  it "should define accessor" do
    FacileSearch::MetaData::BASE_KEYS.each do |key|
      expect(meta_data.respond_to?(key)).to be_truthy
    end
  end

  it "default id_key is id" do
    expect(meta_data.id_field).to eq("id")
  end

  it "default tokenizer is bigram" do
    expect(meta_data.tokenizer.instance_eval { @n }).to eq(2)
  end

  describe "#lock_key" do
    it { expect(meta_data.lock_key).to eq("#{namespace}_lock") }
  end
end

