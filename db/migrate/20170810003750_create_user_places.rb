class CreateUserPlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :user_places do |t|
      t.references :user, foreign_key: true
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
