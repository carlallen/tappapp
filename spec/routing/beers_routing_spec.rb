require "spec_helper"

describe BeersController do
  describe "routing" do

    it "routes to #index" do
      get("/beers").should route_to("beers#index")
    end

    it "routes to #new" do
      get("/beers/new").should route_to("beers#new")
    end

    it "routes to #show" do
      get("/beers/1").should route_to("beers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/beers/1/edit").should route_to("beers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/beers").should route_to("beers#create")
    end

    it "routes to #update" do
      put("/beers/1").should route_to("beers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/beers/1").should route_to("beers#destroy", :id => "1")
    end

  end
end
