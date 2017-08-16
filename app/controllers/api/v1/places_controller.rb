module Api
  module V1

    class PlacesController < ApplicationController
      def index
        render json: Place.all
      end

      def show
        render json: Place.find(params[:id]), include: ['menu_items','menu_items.item_variations']
      end

      def create
        place = Place.create(place_params)
        render json: {message: "Created Place!", place: place, status: 201}
      end

      def destroy
        place = Place.find(params[:id])
        place.destroy
      end

      private

      def place_params
        params.permit(:name, :address, :lat, :long, :google_places_id, :url)
      end
    end

  end
end
