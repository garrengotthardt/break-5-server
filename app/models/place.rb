class Place < ApplicationRecord
  has_many :user_places
  has_many :users, through: :user_places
  has_many :menu_items
  has_many :item_variations, through: :menu_items


  # def self.get_full_place_data(id)
  #   place_data = Place.find(id)
  #   full_place_data = {}
  #   full_place_data.menu_items.map { |menu_item| menu_item.variations = [] }
  #
  #   full_place_data.item_variations.each do |item_var|
  #     menu_item = full_place_data.menu_items.select {|item| item_var.menu_item_id === item.id }
  #     menu_item.variations.push(item_var)
  #   end
  # end

  def self.allWithMenuItems
    Place.all.select do |place|
      place.menu_items.length > 0
    end
  end


end
