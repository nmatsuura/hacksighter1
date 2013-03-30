class Photo < ActiveRecord::Base
 has_attached_file :image
 attr_accessible :image # attr_accessible :title, :body

 belongs_to :sighting
end
