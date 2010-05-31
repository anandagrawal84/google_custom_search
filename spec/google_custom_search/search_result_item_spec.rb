require File.expand_path("#{File.dirname(__FILE__)}/../spec_helper")

describe GoogleCustomSearch::SearchResultItem do

  ITEM_JSON = {"GsearchResultClass"=>"GwebSearch", "title"=>"Tile of the page", "url"=>"http://www.localhost.site/tickets/tickets/production.aspx%3FperformanceNumber%3D17303", "cacheUrl"=>"http://www.google.com/search?q=cache:pGjUcr1qUkgJ:www.localhost.site", "content"=>"This is the content part", "visibleUrl"=>"www.localhost.site", "unescapedUrl"=>"http://www.localhost.site/tickets/tickets/production.aspx?performanceNumber=17303", "titleNoFormatting"=>"Tile of the page"}

  it "should return the title of search item" do
    item = GoogleCustomSearch::SearchResultItem.new ITEM_JSON
    item.title.should == "Tile of the page"
  end

  it "should return the url of search item" do
    item = GoogleCustomSearch::SearchResultItem.new ITEM_JSON
    item.url.should == "http://www.localhost.site/tickets/tickets/production.aspx?performanceNumber=17303"
  end

  it "should return the content of search item" do
    item = GoogleCustomSearch::SearchResultItem.new ITEM_JSON
    item.content.should_not be_nil
  end


end