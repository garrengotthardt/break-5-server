class AddAddressToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :address, :string
  end
end
