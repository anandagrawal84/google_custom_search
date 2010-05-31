require 'uri'
require 'open-uri'
require 'json'

module GoogleCustomSearch

  class Search

    class << self
      attr_accessor :google_search_api_key
    end

    GOOGLE_SEARCH_URL = "http://ajax.googleapis.com/ajax/services/search/web?v=1.0&oe=utf8&ie=utf8&source=uds&hl=en&rsz=large"

    def for keyword
      uri = URI.parse("#{GOOGLE_SEARCH_URL}&cx=#{self.class.google_search_api_key}&q=#{keyword}")
      search_data = uri.read      
      json_data = JSON.parse search_data
      GoogleCustomSearch::SearchResult.new json_data["responseData"]
    end
    
  end

end