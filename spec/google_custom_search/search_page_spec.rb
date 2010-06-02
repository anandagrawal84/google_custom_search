require 'spec'
require File.expand_path("#{File.dirname(__FILE__)}/../spec_helper")

describe GoogleCustomSearch::SearchPage do

  PAGE_JSON = {"label"=>1, "start"=>"0"}

  it "should create search page" do
    page = GoogleCustomSearch::SearchPage.new PAGE_JSON
    page.label.should == 1
    page.start.should == 0
  end

end