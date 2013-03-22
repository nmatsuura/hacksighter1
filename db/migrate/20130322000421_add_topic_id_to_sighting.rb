class AddTopicIdToSighting < ActiveRecord::Migration
  def change
    add_column :sightings, :topic_id, :integer
  end
end
