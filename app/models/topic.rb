class Topic < ActiveRecord::Base
  attr_accessible :name

  belongs_to :sighting

end
