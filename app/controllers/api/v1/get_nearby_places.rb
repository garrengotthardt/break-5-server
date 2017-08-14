module Api
  module V1
    class GetNearByPlacesController < ApplicationController

      def getNearbyPlaces(lat, long)
        @client = GooglePlaces::Client.new('AIzaSyCjEt1fC6-5TCeW7-AXugFRWkjeGImZfyU')
        resultsArray = @client.spots(lat, long, :types => ['restaurant','food'])
        resultsGoogleIDArray = resultsArray.map { |result| result.place_id  }
        fullPlaceDataArray = resultsGoogleIDArray.map { |place_id| @client.spot(place_id)}
        fullPlaceDataArray.each do |place|
          puts "LOCATION INFO:"
          puts place.name
          puts place.place_id
          puts place.formatted_address
          puts place.lat
          puts place.lng
          grabMenuLink(place.url)
          puts
          puts
          puts
          puts
          puts
        end
      end



    end
  end
end
