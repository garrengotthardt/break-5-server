class AddDescriptionToMenuItems < ActiveRecord::Migration[5.1]
  def change
    add_column :menu_items, :description, :string
  end
end
