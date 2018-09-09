require 'faraday'

class FourSquareService
  BASE_URL = 'https://api.foursquare.com'

  def get_list_of_venue
    list_of_venues = convert_to_hash(get_venue_response.body)

    index = 0
    venues =[]

    while index < list_of_venues.length 
      venue = {}
      venue["name"] = list_of_venues[index]["location"]["name"]
      venue["latitude"] = list_of_venues[index]["location"]["lat"]
      venue["longitude"] = list_of_venues[index]["location"]["lng"]

      venues << venue
      index += 1
    end
    return venues
  end

  private 

  def get_popular_response
    connection.get '/v2/venues/explore?' + venue_search_url
  end

  def get_venue_response
    connection.get '/v2/venues/search?' + venue_search_url
  end

  def convert_to_hash(response)
    foursquare_responses = JSON.parse(response)
    foursquare_responses["response"]["venues"]
  end

  def connection 
    Faraday.new(url: BASE_URL)
  end

  def venue_search_url
    {
      radius: '5000',
      client_id: ENV['CLIENT_ID'],
      client_secret: ENV['CLIENT_SECRET'],
      v: '20181231',
      ll: '40.7243,-74.0018'
    }.to_query 
  end

end
