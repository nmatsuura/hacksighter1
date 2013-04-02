class Photo < ActiveRecord::Base
 
 attr_accessible :image # attr_accessible :title, :body

 belongs_to :sighting

 has_attached_file :image
 
end
