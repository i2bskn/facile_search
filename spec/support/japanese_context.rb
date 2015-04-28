shared_context "japanese" do
  let(:samples_ja) do
    text = [
      "今日の一針明日の十針",
      "今日の後に今日なし",
      "明日は明日の風が吹く"
    ]

    klass = Struct.new(:id, :text)
    text.map.with_index(1) {|t,i| klass.new(i, t) }
  end
end

