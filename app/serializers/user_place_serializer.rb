class UserPlaceSerializer < ActiveModel::Serializer
  attributes :id, :place_id, :user_id
  belongs_to :user
  has_many :places
  # has_many :item_variations, through: :menu_items, foreign_key: :menu_item_id
end
#
