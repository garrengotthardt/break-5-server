module Api
  module V1

    class PlacesController < ApplicationController
      def index
        render json: Place.all
      end

      def show
        render json: Place.find(params[:id])

        # full_place_data = Place.get_full_place_data(params[:id])
        # byebug
        # render json: full_place_data
      end

      def create
        place = Place.create(place_params)
        render json: {message: "Created Place!", place: place, status: 201}
      end

      private

      def place_params
        params.permit(:name, :address, :lat, :long, :google_places_id)
      end
    end

  end
end
