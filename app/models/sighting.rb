class Sighting < ActiveRecord::Base
  attr_accessible :location, :longitude, :latitude, :topic_id, :photos_attributes, :sighted_at, :sighted_date, :sighted_time
  geocoded_by :location
  after_validation :geocode, :if => :location_changed?
	
	has_many :photos
  	accepts_nested_attributes_for :photos

  	belongs_to :user
  	has_many :comments
  	belongs_to :topic 

	validates :location, presence: true
	validates :user, presence: true

	acts_as_gmappable :process_geocoding => false

	
	def gmaps4rails_address
	 	"#{longitude}, #{latitude}" #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki "#{self.street}, #{self.city}, #{self.country}" 
	end

	# def sighted_at=(date)
	# 	self[:sighted_at] = Time.zone.parse(date)
	# end

	attr_accessor :sighted_date, :sighted_time

	before_validation :set_sighted_at

	def set_sighted_at
		if sighted_date.present?
			self[:sighted_at] = Time.zone.parse("#{sighted_date} #{sighted_time}")
		end
	end

	def sighted_at
		self[:sighted_at] || self.created_at
	end

end
