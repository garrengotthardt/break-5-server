class ItemVariationSerializer < ActiveModel::Serializer
  attributes :id, :variation, :price, :menu_item_id
  belongs_to :menu_item
end
