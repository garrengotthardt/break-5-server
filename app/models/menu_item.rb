class MenuItem < ApplicationRecord
  belongs_to :place
  has_many :item_variations, dependent: :destroy

end
