class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :address, :lat, :long
  has_many :user_places
  # has_many :item_variations, through: :menu_items, foreign_key: :menu_item_id
end
#
