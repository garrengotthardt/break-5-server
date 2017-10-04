module Api
  module V1

    class UserPlacesController < ApplicationController

      def index
        render json: UserPlace.all
      end

      def show
        render json: UserPlace.find(params[:id])
      end

      def create
        if UserPlace.create(user_place_params)
          render json: {message: "Saved!", status: 201}
        else
          render json: {message: "Place could not be saved.", status: 201}
        end
      end


      def destroy
        place = UserPlace.find(params[:id])
        if place.destroy
          render json: {message: "Unsaved!", place: place, status: 201}
        else
          render json: {message: "Place could not be unsaved.", place: place, status: 201}
        end
      end

      private

      def user_place_params
        params.permit(:user_id, :place_id)
      end

    end
  end
end
