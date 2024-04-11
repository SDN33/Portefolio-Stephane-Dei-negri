require 'net/http'
require 'uri'
require 'json'

class GeocodingsController < ApplicationController
  def show
    uri = URI("https://maps.googleapis.com/maps/api/geocode/json")
    params = { latlng: "#{params[:lat]},#{params[:lng]}", key: ENV['GOOGLE_MAPS_API_KEY'] }
    uri.query = URI.encode_www_form(params)

    response = Net::HTTP.get_response(uri)
    render json: JSON.parse(response.body)
  end
end
