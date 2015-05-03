require "spec_helper"

describe FacileSearch::Utils do
  describe "#divide_queries" do
    it {
      expect(FacileSearch.divide_queries("")).to be_empty
    }

    it {
      queries = "Simple search with inverted index."
      expect(FacileSearch.divide_queries(queries)).to have_attributes(size: 5)
    }

    it {
      queries = "今日　明日"
      expect(FacileSearch.divide_queries(queries)).to have_attributes(size: 2)
    }

    it {
      queries = "今日　 明日"
      expect(FacileSearch.divide_queries(queries)).to have_attributes(size: 2)
    }
  end
end

