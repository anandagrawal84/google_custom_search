module GoogleCustomSearch
  class SearchResult
    def initialize result
      @result = result
    end

    def estimated_count
      result_data["cursor"]["estimatedResultCount"].to_i
    end

    def current_page_index
      result_data["cursor"]["currentPageIndex"].to_i
    end

    def items
      result_data["results"].collect { |result| SearchResultItem.new result }
    end
    
    def pages
      pages = result_data["cursor"]["pages"] || []
      pages.collect { |page| SearchPage.new page}
    end

    def range
      starting_value = result_data["cursor"]["pages"][current_page_index]["start"].to_i + 1
      ending_value = starting_value + items.count - 1
      starting_value..ending_value
    end

    def errors
      if @result['responseStatus'] == 400
        return [@result['responseDetails']]
      end
      []
    end

    def has_errors?
      errors.count != 0
    end

    private
    def result_data
      @result["responseData"]
    end
  end
end