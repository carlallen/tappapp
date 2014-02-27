json.array!(@breweries) do |brewery|
  json.extract! brewery, :id, :name
  json.description brewery.description
  json.location brewery.location
end
