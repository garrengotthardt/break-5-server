module Api
  module V1

    class CreateNestedController < ApplicationController

      def create
        @place = Place.find_or_create_by(google_places_id: params[:google_places_id])
        @place.update_attributes(place_params)

        @menu_item = MenuItem.new(name: params[:newMenuItem][:name], category: params[:newMenuItem][:category], place_id: @place.id)
        #add check if valid
        @menu_item.save

        @item_variation = ItemVariation.new(variation: params[:newMenuItemVariations][:variation], price: params[:newMenuItemVariations][:price].to_f, menu_item_id: @menu_item.id  )
        #add check if valid
        @item_variation.save

        render json: {placeID: @place.id, message: "Item added!", status: 201}
      end

      private

      def place_params
        params.permit(:name, :address, :lat, :long, :google_places_id)
      end

      # def menu_item_params
      #   params.permit(:newMenuItem)
      # end
      #
      # def item_variation_params
      #   params.permit(:variation, :price)
      # end
    end

  end
end
