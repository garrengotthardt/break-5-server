class ItemVariationSerializer < ActiveModel::Serializer
  attributes :id, :variation, :price
  belongs_to :menu_item
end
