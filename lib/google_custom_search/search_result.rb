module GoogleCustomSearch
  class SearchResult
    def initialize result
      @result = result
    end

    def estimated_count
      @result["cursor"]["estimatedResultCount"].to_i
    end

    def items
      @result["results"]
    end
  end
end