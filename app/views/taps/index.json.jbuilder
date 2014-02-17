json.array!(@taps) do |tap|
  json.extract! tap, :id, :number, :beer_id
  json.url tap_url(tap, format: :json)
end
