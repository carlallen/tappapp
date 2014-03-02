json.extract! tap, :id, :beer_id, :created_at, :updated_at
if tap.beer.present?
  json.extract! tap, :beer_name, :brewery_name
  json.extract! tap.beer, :ibu, :abv, :srm
end
