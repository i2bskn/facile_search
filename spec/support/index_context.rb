shared_context "index" do
  let(:meta_data) {
    m = FacileSearch::MetaData.new(namespace: "example", text_field: "text")
    m.tokenizer.add_hook(FacileSearch::Tokenizer::NormalizationHook)
    m
  }
  let(:index) { FacileSearch::InvertedIndex.new(meta_data) }
end

