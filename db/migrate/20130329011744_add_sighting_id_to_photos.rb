class AddSightingIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :sighting_id, :integer
  end
end
