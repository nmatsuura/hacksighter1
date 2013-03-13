class Sighting < ActiveRecord::Base
  attr_accessible :location

  	belongs_to :user
  	has_many :comments

	validates :location, presence: true
	validates :user, presence: true

end
