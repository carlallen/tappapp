class BreweryDbService

  def self.client
    @client ||= BreweryDB::Client.new do |config|
      config.api_key = ENV['BREWERY_DB_API_KEY']
    end
  end

  def self.search_beers(query)
    client.search.beers(q: query, withBreweries: "Y").take(10)
  rescue BreweryDB::Unauthorized
    []
  end

  def self.search_breweries(query)
    breweries = client.search.breweries(q: query).take(3)
    # This is necessary because BreweryDb only provides the location of the breweries as part
    # of the beers api (unless you pay for premium). So after I query the breweries,
    # I get the beers for each brewery. Then I get the beer again to return the location data.
    breweries.each do |brewery|
      beers = client.brewery(brewery.id).beers || []
      if beer = beers.first
        location = client.beers.find(beer.id, withBreweries: "Y").breweries.first.locations.first
        brewery.location = "#{location.locality}, #{location.region}"
      end
    end
  rescue BreweryDB::Unauthorized
    []
  end

end