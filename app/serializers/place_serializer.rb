class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :lat, :long, :google_places_id
  has_many :menu_items
  # has_many :item_variations, through: :menu_items, foreign_key: :menu_item_id
end
#
