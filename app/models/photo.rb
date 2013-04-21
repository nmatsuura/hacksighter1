class Photo < ActiveRecord::Base
 
 attr_accessible :image # attr_accessible :title, :body

 belongs_to :sighting

 has_attached_file :image,
	  	styles: {
	  		thumb: '100x100>',
	  		small: '150x150>',
	  		medium: '200x200>',
	  		large: '300x300>'
	  	},
	  	storage: :s3, s3_credentials: {
	  		access_key_id: "AKIAJ3YA3T7EJX4HPKCA",
  			secret_access_key: "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",
  			bucket: 'Hacksighter'
	  	}

end