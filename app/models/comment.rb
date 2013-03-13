class Comment < ActiveRecord::Base
  attr_accessible :body, :sighting_id

  belongs_to :sighting
  belongs_to :user
  
  validates :body, presence: true

end
