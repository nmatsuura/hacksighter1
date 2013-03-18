class Sighting < ActiveRecord::Base
  attr_accessible :location, :longitude, :latitude
  geocoded_by :location
  after_validation :geocode, :if => :location_changed?

  	belongs_to :user
  	has_many :comments

	validates :location, presence: true
	validates :user, presence: true

end
