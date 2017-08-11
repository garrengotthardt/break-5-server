module Api
  module V1
    class ItemVariationsController < ApplicationController
      def index
        render json: ItemVariation.all
      end

      def show
        render json: ItemVariation.find(params[:id])

      end

      def create
        menu_item = ItemVariation.create(item_variation_params)
        render json: {message: "Created MenuItem!", menu_item: menu_item, status: 201}
      end

      private

      def item_variation_params
        params.permit(:menu_item_id, :variation, :price)
      end
    end
  end
end
