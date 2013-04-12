class AddSightedAtToSightings < ActiveRecord::Migration
  def change
    add_column :sightings, :sighted_at, :datetime
  end
end
