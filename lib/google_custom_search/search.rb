require 'uri'
require 'open-uri'
require 'json'

module GoogleCustomSearch

  class Search

    SIZE_TO_COUNT_MAP = {"small" => 4, "large" => 8}

    class << self
      attr_accessor :google_search_api_key
    end
    def initialize
      @page_index = 0
      @query_parameters = {
              :rsz => "large",
              :start => 0
      }
    end

    def for keyword
      uri = build_query_url(keyword)
      search_data = uri.read
      json_data = JSON.parse search_data
      GoogleCustomSearch::SearchResult.new json_data
    end

    def with_small_result_set
      @query_parameters[:rsz] = "small"
      self
    end

    def with_page_index index
      @page_index = index - 1
      self
    end

    private
    def build_query_url(keyword)
      @query_parameters[:start] = SIZE_TO_COUNT_MAP[@query_parameters[:rsz]] * @page_index       
      google_search_url = "http://ajax.googleapis.com/ajax/services/search/web?v=1.0&oe=utf8&ie=utf8&source=uds&hl=en"
      arguments = @query_parameters.collect { |key, value| "#{key}=#{value}" }
      arguments.sort!
      URI.parse("#{google_search_url}&cx=#{self.class.google_search_api_key}&q=#{keyword}&"+arguments.join("&"))
    end

  end

end