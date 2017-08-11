class MenuItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :category
  belongs_to :place
end
