shared_context "index" do
  let(:meta_data) { FacileSearch::MetaData.new(namespace: "example", text_field: "text") }
  let(:index) { FacileSearch::InvertedIndex.new(meta_data) }
end

