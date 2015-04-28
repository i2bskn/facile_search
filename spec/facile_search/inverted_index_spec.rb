require "spec_helper"

describe FacileSearch::InvertedIndex do
  include_context "japanese"
  include_context "index"

  describe "#indexing" do
    it {
      Redis.current.flushdb
      expect {
        samples_ja.each {|sample| index.indexing(sample) }
      }.to change { Redis.current.hlen("example") }
    }
  end

  describe "#search" do
    before do
      samples_ja.each {|sample| index.indexing(sample) }
    end

    it { expect(index.search(["今日"])).to eq([1, 2]) }
  end

  describe "#serialize" do
    it do
      obj = [*1..3]
      expect(index.send(:serialize, obj)).to eq(Oj.dump(obj))
    end
  end

  describe "#deserialize" do
    it do
      obj = [*1..3]
      expect(index.send(:deserialize, Oj.dump(obj))).to eq(obj)
    end
  end

  describe "#redis" do
    it { expect(index.send(:redis)).to eq(Redis.current) }
  end
end

