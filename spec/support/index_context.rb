shared_context "index" do
  let(:meta_data) { FacileSearch::MetaData.new(namespace: "example", text_key: "text") }
  let(:index) { FacileSearch::InvertedIndex.new(meta_data) }
end

