module FacileSearch
  module Utils
    def divide_queries(queries)
      queries.split(/[[:blank:]]/)
    end
  end
  extend Utils
end

