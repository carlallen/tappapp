require "spec_helper"

describe TapsController do
  describe "routing" do

    it "routes to #index" do
      get("/taps").should route_to("taps#index")
    end

    it "routes to #new" do
      get("/taps/new").should route_to("taps#new")
    end

    it "routes to #show" do
      get("/taps/1").should route_to("taps#show", :id => "1")
    end

    it "routes to #edit" do
      get("/taps/1/edit").should route_to("taps#edit", :id => "1")
    end

    it "routes to #create" do
      post("/taps").should route_to("taps#create")
    end

    it "routes to #update" do
      put("/taps/1").should route_to("taps#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/taps/1").should route_to("taps#destroy", :id => "1")
    end

  end
end
