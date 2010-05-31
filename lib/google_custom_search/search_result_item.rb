module GoogleCustomSearch

  class SearchResultItem

    attr_reader :title, :content

    def initialize(hash = {})
      @errors = []
      hash.each do |key, value|
        self.instance_variable_set("@#{key}", value)
      end
    end

    def url
      @unescapedUrl
    end
  end
end
