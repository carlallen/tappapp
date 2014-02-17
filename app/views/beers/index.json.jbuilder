json.array!(@beers) do |beer|
  json.extract! beer, :id, :name, :description, :brewery_name, :ibu, :srm, :abv
  json.url beer_url(beer, format: :json)
end
