json.array!(@breweries) do |brewery|
  json.extract! brewery, :id, :name, :location, :description
  json.url brewery_url(brewery, format: :json)
end
