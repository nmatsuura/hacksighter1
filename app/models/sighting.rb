class Sighting < ActiveRecord::Base
  attr_accessible :location, :longitude, :latitude, :topic_id, :photo
  geocoded_by :location
  after_validation :geocode, :if => :location_changed?
	has_one :photo
  accepts_nested_attributes_for :photo

  	belongs_to :user
  	has_many :comments
  	belongs_to :topic

	validates :location, presence: true
	validates :user, presence: true

	acts_as_gmappable :process_geocoding => false

	def gmaps4rails_address
	 	"#{longitude}, #{latitude}" #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki "#{self.street}, #{self.city}, #{self.country}" 
	end

end
