class Sighting < ActiveRecord::Base
  attr_accessible :location, :longitude, :latitude
  geocoded_by :location
  after_validation :geocode, :if => :location_changed?

  	belongs_to :user
  	has_many :comments

	validates :location, presence: true
	validates :user, presence: true

	# acts_as_gmappable

	# def gmaps4rails_address
	# 	Gmaps4rails.geocode(location) #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki "#{self.street}, #{self.city}, #{self.country}" 
	# end

end
