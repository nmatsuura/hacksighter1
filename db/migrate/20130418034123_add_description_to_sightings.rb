class AddDescriptionToSightings < ActiveRecord::Migration
  def change
    add_column :sightings, :description, :text
  end
end
