i = 0
json.array!(@taps) do |tap|
  json.id tap.id
  json.number i += 1
  if tap.beer.present?
    json.extract! tap, :beer_name, :brewery_name
  end
end
