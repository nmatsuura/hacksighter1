class Photo < ActiveRecord::Base
 
 attr_accessible :image # attr_accessible :title, :body

 belongs_to :sighting

 has_attached_file :image,
	  	styles: {
	  		thumb: '100x100>',
	  		small: '150x150>',
	  		medium: '200x200>',
	  		large: '300x300>'
	  	}

end