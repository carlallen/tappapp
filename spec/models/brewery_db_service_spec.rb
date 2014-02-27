require 'spec_helper'

describe BreweryDbService do
  subject { BreweryDbService }

  it {should respond_to(:client)}
  it {should respond_to(:search_beers)}
  it {should respond_to(:search_breweries)}

  describe ".search_beers" do
    it "searches the BreweryDB api for beers" do
      response = File.new("spec/request_stubs/beers_search.txt")
      stub_request(:get, "http://api.brewerydb.com/v2/search?key&q=Day%20Tripper&type=beer&withBreweries=Y").to_return(response)
      subject.search_beers("Day Tripper").length.should eq(10)
    end
  end

  describe ".search_breweries" do
    it "searches the BreweryDB api for breweries" do
      response = File.new("spec/request_stubs/breweries_search.txt")
      stub_request(:get, "http://api.brewerydb.com/v2/search?key&q=Indeed&type=brewery").to_return(response)
      response = File.new("spec/request_stubs/brewery_beers.txt")
      stub_request(:get, "http://api.brewerydb.com/v2/brewery/LhenPJ/beers?key").to_return(response)
      response = File.new("spec/request_stubs/beer.txt")
      stub_request(:get, "http://api.brewerydb.com/v2/beer/Ccu4qm?key&withBreweries=Y").to_return(response)
      subject.search_breweries("Indeed").first.location.should eq("Minneapolis, Minnesota")
    end
  end

end
