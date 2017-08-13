class MenuItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :place_id
  belongs_to :place
  has_many :item_variations
end
