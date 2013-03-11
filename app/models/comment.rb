class Comment < ActiveRecord::Base
  attr_accessible :body, :sighting_id

  validates :body, presence: true

  belongs_to :sighting
end
