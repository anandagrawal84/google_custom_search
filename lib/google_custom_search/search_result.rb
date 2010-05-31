module GoogleCustomSearch
  class SearchResult
    def initialize result
      @result = result
    end

    def estimated_count
      @result["cursor"]["estimatedResultCount"].to_i
    end

    def current_page_index
      @result["cursor"]["currentPageIndex"].to_i
    end

    def items
      @result["results"].collect { |result| SearchResultItem.new result }
    end
  end
end