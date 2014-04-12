class BreweriesController < ApplicationController
  before_filter :authenticate_user!, except: %w(index show)

  make_resourceful do
    actions :all
  end

  # GET /breweries/search.json
  def search
    @breweries = BreweryDbService.search_breweries(params[:q])
  end

  def object_parameters
    return nil if action_name == "new"
    params.require(:brewery).permit(:name, :location, :description)
  end
  private :object_parameters
end
