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
    
    def pages
      pages = @result["cursor"]["pages"] || []
      pages.collect { |page| SearchPage.new page}
    end

    def range
      starting_value = @result["cursor"]["pages"][current_page_index]["start"].to_i + 1
      ending_value = starting_value + items.count - 1
      starting_value..ending_value
    end
  end
end