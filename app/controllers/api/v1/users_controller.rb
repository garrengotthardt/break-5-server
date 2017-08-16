module Api
  module V1

    class UsersController < ApplicationController
      require 'get_nearby_places'

      def index
        render json: User.all
      end

      def show
        render json: User.find(params[:id])

      end

      def create
        @user = User.new(user_params)

        if @user.save
          created_jwt = issue_token(id: @user.id)
          render json: { email: @user.email, id: @user.id, jwt: created_jwt }
        else
          render json: {
            error: 'Email already exists'
          }, status: 422
        end
      end

      def update
        @user = User.find(params[:id])
        oldLat = @user.lat
        oldLong = @user.long

        if @user.update(user_params)

          if oldLat != @user.lat || oldLong != @user.long  
            getNearbyPlaces(user_params[:lat], user_params[:long])
          end

          render json: {user: @user, message: "User was updated!", status: 201}

        else
          render json: @user.errors, message: "Could not update User!", status: 401

        end
      end

      private

      def user_params
        params.require(:user).permit(:id, :first_name, :last_name, :email, :password, :password_confirmation, :address, :lat, :long)
      end
    end

  end
end
