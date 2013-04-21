class Topic < ActiveRecord::Base
  attr_accessible :name

  #has_many :sightings
	has_many :sightings, :order => "sighted_at ASC"

end
