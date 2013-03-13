class User < ActiveRecord::Base
  attr_accessible :email, :name

  has_many :sightings
  has_many :comments
  
end
