module Api
  module V1

    class UsersController < ApplicationController
      def index
        render json: User.all
      end

      def show
        render json: User.find(params[:id])

      end

      def create
        @user = User.new(user_params)
        byebug
        if @user.valid?
          @user.save
          render json: {user: @user, message: "User was created!", status: 201}
        end
      end

      def update
        @user = User.find(params[:id])

        if @user.update(lat: params[:lat], long: params[:long], address: params[:address])

          ## SEND REQUEST TO MENU ITEM FINDER

          render json: {user: @user, message: "User was updated!", status: 201}
        else
          render json: @user.errors, message: "Could not update User!", status: 401
        end
      end

      private

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :address, :lat, :long)
      end
    end

  end
end
