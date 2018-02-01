require 'open-uri'

class MeteorologistController < ApplicationController
  def street_to_weather_form
    # Nothing to do here.
    render("street_to_weather_form.html.erb")
  end

  def street_to_weather
    @street_address = params[:user_street_address]
    url_safe_street_address = URI.encode(@street_address)

    # ==========================================================================
    # Your code goes below.
    # The street address the user input is in the string @street_address.
    # A URL-safe version of the street address, with spaces and other illegal
    #   characters removed, is in the string url_safe_street_address.
    # ==========================================================================

    url = "https://maps.googleapis.com/maps/api/geocode/json?address="+url_safe_street_address
    parsed_data = JSON.parse(open(url).read)
    @latitude = parsed_data.dig("results", 0, "geometry", "location", "lat")
    @longitude = parsed_data.dig("results", 0, "geometry", "location", "lng")
    
    second_url = "https://api.darksky.net/forecast/eef2b1f8ad4a93bcf2088939dafc46f4/#{@latitude},#{@longitude}"
    met_parsed_data = JSON.parse(open(second_url).read)
    
    @current_temperature = met_parsed_data.dig("currently", "temperature")

    @current_summary = met_parsed_data.dig("currently", "summary")

    @summary_of_next_sixty_minutes = met_parsed_data.dig("minutely", "summary")

    @summary_of_next_several_hours = met_parsed_data.dig("hourly", "summary")

    @summary_of_next_several_days = met_parsed_data.dig("daily", "summary")

    render("meteorologist/street_to_weather.html.erb")
  end
end
