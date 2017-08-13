module Api
  module V1
    class GetNearByPlacesController < ApplicationController

      def getNearbyPlaces(lat, long)
        @client = GooglePlaces::Client.new('AIzaSyCjEt1fC6-5TCeW7-AXugFRWkjeGImZfyU')
        resultsArray = @client.spots(lat, long, :types => ['restaurant','food'])
        resultsGoogleIDArray = resultsArray.map { |result| result.place_id  }
        fullPlaceDataArray = resultsGoogleIDArray.map { |place_id| @client.spot(place_id)}
        arrayOfURLs = fullPlaceDataArray.map { |place| place.url }
        arrayOfURLs.each do |url|
          grabMenuLink(url)
        end
      end

    end
  end
end
