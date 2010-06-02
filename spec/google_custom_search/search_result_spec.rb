require 'spec'
require File.expand_path("#{File.dirname(__FILE__)}/../spec_helper")

describe GoogleCustomSearch::SearchResult do

  RESULTS_JSON = {"results"=>[{"GsearchResultClass"=>"GwebSearch", "title"=>"Tile of the page", "url"=>"http://www.localhost.site/tickets/tickets/production.aspx%3FperformanceNumber%3D17303", "cacheUrl"=>"http://www.google.com/search?q=cache:pGjUcr1qUkgJ:www.localhost.site", "content"=>"Search matching content", "visibleUrl"=>"www.localhost.site", "unescapedUrl"=>"http://www.localhost.site/tickets/tickets/production.aspx?performanceNumber=17303", "titleNoFormatting"=>"Tile of the page"},
                              {"GsearchResultClass"=>"GwebSearch", "title"=>"Tile of the page", "url"=>"http://www.localhost.site/tickets/tickets/reserve.aspx%3FperformanceNumber%3D21140", "cacheUrl"=>"http://www.google.com/search?q=cache:E5_VPQiQo3kJ:www.localhost.site", "content"=>"1234", "visibleUrl"=>"www.localhost.site", "unescapedUrl"=>"http://www.localhost.site/tickets/tickets/reserve.aspx?performanceNumber=21140", "titleNoFormatting"=>"Tile of the page"},
                              {"GsearchResultClass"=>"GwebSearch", "title"=>"Tile of the page", "url"=>"http://www.localhost.site/tickets/tickets/production.aspx%3FperformanceNumber%3D23379", "cacheUrl"=>"http://www.google.com/search?q=cache:V7cn6Foe2rMJ:www.localhost.site", "content"=>"abcd", "visibleUrl"=>"www.localhost.site", "unescapedUrl"=>"http://www.localhost.site/tickets/tickets/production.aspx?performanceNumber=23379", "titleNoFormatting"=>"Tile of the page"},
                              {"GsearchResultClass"=>"GwebSearch", "title"=>"Tile of the page", "url"=>"http://www.localhost.site/tickets/tickets/production.aspx%3FperformanceNumber%3D17350", "cacheUrl"=>"http://www.google.com/search?q=cache:fJurfpC17DYJ:www.localhost.site", "content"=>"uiuio", "visibleUrl"=>"www.localhost.site", "unescapedUrl"=>"http://www.localhost.site/tickets/tickets/production.aspx?performanceNumber=17350", "titleNoFormatting"=>"Tile of the page"},
                              {"GsearchResultClass"=>"GwebSearch", "title"=>"Tile of the page", "url"=>"http://www.localhost.site/tickets/tickets/production.aspx%3FperformanceNumber%3D23374", "cacheUrl"=>"http://www.google.com/search?q=cache:jExxaBgeDD0J:www.localhost.site", "content"=>"this looks great", "visibleUrl"=>"www.localhost.site", "unescapedUrl"=>"http://www.localhost.site/tickets/tickets/production.aspx?performanceNumber=23374", "titleNoFormatting"=>"Tile of the page"},
                              {"GsearchResultClass"=>"GwebSearch", "title"=>"Tile of the page", "url"=>"http://www.localhost.site/tickets/tickets/production.aspx%3FperformanceNumber%3D17353", "cacheUrl"=>"http://www.google.com/search?q=cache:h43Ggs_qthYJ:www.localhost.site", "content"=>"super duper content", "visibleUrl"=>"www.localhost.site", "unescapedUrl"=>"http://www.localhost.site/tickets/tickets/production.aspx?performanceNumber=17353", "titleNoFormatting"=>"Tile of the page"},
                              {"GsearchResultClass"=>"GwebSearch", "title"=>"Tile of the page", "url"=>"http://www.localhost.site/tickets/calendar/", "cacheUrl"=>"http://www.google.com/search?q=cache:cI47PY7ITc4J:www.localhost.site", "content"=>"this should be useful", "visibleUrl"=>"www.localhost.site", "unescapedUrl"=>"http://www.localhost.site/tickets/calendar/", "titleNoFormatting"=>"Tile of the page"},
                              {"GsearchResultClass"=>"GwebSearch", "title"=>"Tile of the page - Your Show Place!", "url"=>"http://localhost.site/%3Fop%3Dcontact", "cacheUrl"=>"http://www.google.com/search?q=cache:UUq_Mw_-UnIJ:localhost.site", "content"=>"cards game", "visibleUrl"=>"localhost.site", "unescapedUrl"=>"http://localhost.site/?op=contact", "titleNoFormatting"=>"Tile of the page - Your Show Place!"}],
                  "cursor"=>{"estimatedResultCount"=>"409", "currentPageIndex"=>3,
                             "moreResultsUrl"=>"http://www.google.com/cse?oe=utf8&ie=utf8&source=uds&cx=004905679161489350096%3Arymp5afccji&start=28&hl=en&q=org",
                             "pages"=>[{"label"=>1, "start"=>"0"}, {"label"=>2, "start"=>"8"}, {"label"=>3, "start"=>"16"}, {"label"=>4, "start"=>"24"}, {"label"=>5, "start"=>"32"}, {"label"=>6, "start"=>"40"}, {"label"=>7, "start"=>"48"}, {"label"=>8, "start"=>"56"}]}, 
                  "context"=>{"title"=>"Cultural District Search Engine", "facets"=>[]}}

  it "should find the estimated count from the given search result json data" do
    result = GoogleCustomSearch::SearchResult.new RESULTS_JSON
    result.estimated_count.should == 409
  end

  it "should return the index of current page" do
    result = GoogleCustomSearch::SearchResult.new RESULTS_JSON
    result.current_page_index.should == 3
  end

  it "should return the range of results" do
    result = GoogleCustomSearch::SearchResult.new RESULTS_JSON
    result.range.should == (25..32)
  end

  describe "pages" do
    it "should return the search result pages" do
      result = GoogleCustomSearch::SearchResult.new RESULTS_JSON
      result.pages.size.should == 8
    end

    it "should return label for page" do
      result = GoogleCustomSearch::SearchResult.new RESULTS_JSON
      result.pages.first.label.should == 1
    end
  end

  describe "items" do
    it "should return the search result items" do
      result = GoogleCustomSearch::SearchResult.new RESULTS_JSON
      result.items.size.should == 8
    end

    it "should return the title of search item" do
      result = GoogleCustomSearch::SearchResult.new RESULTS_JSON
      result.items.first.title.should == "Tile of the page"
    end
  end


end