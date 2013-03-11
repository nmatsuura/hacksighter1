class Sighting < ActiveRecord::Base
  attr_accessible :location

  validates :location, presence: true

  has_many :comments

end
