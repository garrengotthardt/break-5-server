module Api
  module V1

    class MenuItemsController < ApplicationController
      def index
        render json: MenuItem.all
      end

      def show
        render json: MenuItem.find(params[:id])

      end

      def create
        menu_item = MenuItem.create(menu_item_params)
        render json: {message: "Created MenuItem!", menu_item: menu_item, status: 201}
      end

      def destroy
        menuItem = MenuItem.find(params[:id])
        menuItem.destroy
      end

      private

      def menu_item_params
        params.permit(:name, :description, :place_id, :category)
      end
    end

  end
end
