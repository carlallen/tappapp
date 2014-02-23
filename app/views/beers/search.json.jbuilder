json.array!(@beers) do |beer|
  json.extract! beer, :id, :name
  json.description beer.description
  json.ibu beer.ibu
  json.abv beer.abv
  json.srm beer.style.try(:srm_max)
  json.brewery_name beer.breweries.first.name
end
