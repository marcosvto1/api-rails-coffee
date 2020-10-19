class GetGoogleCoffeeDetailsService 
  def initialize(google_place_id)
    @google_place_id = google_place_id
  end

  def call
    begin
      google_key = "#{Rails.application.credentials.google_secret_key}"
      base_url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{@google_place_id}&key=#{google_key}"

      response = RestClient.get base_url
      JSON.parse(response.body)
    rescue RestClient::ExceptionWithResponse =>
      e.response
    end
  end
end