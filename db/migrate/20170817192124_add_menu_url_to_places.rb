class AddMenuUrlToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :menu_url, :string
  end
end
