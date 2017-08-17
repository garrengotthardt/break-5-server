class ChangeUrlToGoogleUrlOnPlaces < ActiveRecord::Migration[5.1]
  def change
    rename_column :places, :url, :google_url
  end
end
