class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.string :location

      t.timestamps
    end
  end
end
