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

      def update
        @place = Place.find(params[:id])

        if @place.update(place_params)

          render json: {user: @place, message: "Place was updated!", status: 201}

        else
          render json: @place.errors, message: "Could not update place!", status: 401
        end
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
