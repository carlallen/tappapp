require 'spec_helper'

describe "Breweries" do
  describe "GET /breweries" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get breweries_path
      response.status.should be(200)
    end
  end
end
