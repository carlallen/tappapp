class BeersController < ApplicationController
  before_action :authenticate_user!, except: %w(index show)

  make_resourceful do
    actions :all
  end

  include LimitedByName

  # GET /beers/search.json
  def search
    @beers = BreweryDbService.search_beers(params[:q])
  end

  def object_parameters
    return nil if action_name == "new"
    params.require(:beer).permit(:name, :description, :brewery_name, :ibu, :srm, :abv, :brewery_db_id, :label_url)
  end
  private :object_parameters
end
