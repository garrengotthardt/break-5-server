class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :google_places_id

      t.timestamps
    end
  end
end
