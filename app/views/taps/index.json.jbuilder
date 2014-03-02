i = 0
json.array!(@taps) do |tap|
  json.number i += 1
  json.partial! "taps/tap", tap: tap
end
