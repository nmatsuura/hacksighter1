class AddLatitudeAndLongitudeToSighting < ActiveRecord::Migration
  def change
    add_column :sightings, :latitude, :float
    add_column :sightings, :longitude, :float
  end
end
