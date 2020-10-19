require 'rest-client'
require 'json'

class GetGoogleCoffeeListService 
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def call
    begin
      google_key = "#{Rails.application.credentials.google_secret_key}"
      p google_key
      location = "#{@latitude},#{@longitude}"
      base_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=coffee+shops&location=#{location}&radius=5000&key=#{google_key}"
      p base_url
      response = RestClient.get base_url
      JSON.parse(response.body)
    rescue RestClient::ExceptionWithResponse =>
      e.response
    end
  end
end