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
        if @user.valid?
          @user.save
          render json: {user: @user, message: "User was created!", status: 201}
        end
      end

      private

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :address, :lat, :long)
      end
    end

  end
end
