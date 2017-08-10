class CreateItemVariations < ActiveRecord::Migration[5.1]
  def change
    create_table :item_variations do |t|
      t.references :menu_item, foreign_key: true
      t.string :variation
      t.float :price

      t.timestamps
    end
  end
end
