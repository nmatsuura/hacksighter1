class SightingsController < ApplicationController

	before_filter :authenticate_user!, except: [:index]

	def index
		@q = Sighting.search(params[:q])
		if params[:q].present?
			@sightings = @q.result
		elsif params[:topic].present?
			@sightings = Sighting.includes(:comments).where(topic_id: params[:topic])
		else
			@sightings = Sighting.includes(:comments).all
		end
		
		@sightings_all = Sighting.includes(:comments).all

		@users = User.all

		@current_user = current_user
	 	
		@topics = Topic.all

		@sightings_recent5 = Sighting.recent5

		# Try to implement different markers

		@sighting_last=Sighting.last
		    @json1 = @sighting_last.to_gmaps4rails do |sighting, marker|

			  marker.picture({
			                  :picture => "http://www.google.com/intl/en_us/mapfiles/ms/micons/red-dot.png",
			                  :width   => 32,
			                  :height  => 32
			                 })
			
			  marker.infowindow render_to_string(:partial => "/sightings/infowindow", :locals => { :sighting => sighting})
			  marker.json({:when => sighting.sighted_at.to_s})
			  
			  end

		@sighting_rest = Sighting.where(id: (1..(Sighting.last.id-1)))
		    @json2= @sighting_rest.to_gmaps4rails do |sighting, marker|

			  marker.picture({
			                  :picture => "http://www.google.com/intl/en_us/mapfiles/ms/micons/blue-dot.png",
			                  :width   => 32,
			                  :height  => 32
			                 })
			
			  marker.infowindow render_to_string(:partial => "/sightings/infowindow", :locals => { :sighting => sighting})
			  marker.json({:when => sighting.sighted_at.to_s})
		  
			  end

		    @json = (JSON.parse(@json1) + JSON.parse(@json2)).to_json




		# @json = @sightings.to_gmaps4rails do |sighting, marker|

	 # 	 marker.infowindow render_to_string(:partial => "/sightings/infowindow", :locals => { :sighting => sighting})

	 	 # marker.json({:when => sighting.sighted_at.strftime("%b %d, %Y")})
	# 	 marker.json({:when => sighting.sighted_at.to_s})
	 	
	 	# end

	

# topics = [
# {id: 1, name: "Rob ford", count: 10},
# {id: 2, name: "bike acc", count: 4}
# ]

# count: 4 >>>>> count: Sighting.where(topic_id: topic.id).count


# Look for ruby method COLLECT


		# if params[:user_id]
		# 	@sightings = Sighting.where(user_id: params[:user_id])
		# else
		# 	@sightings = Sighting
		# end
		# @sightings = @sightings.includes(:comments)
	end

	def new
		@sighting = Sighting.new
		@photos = 3.times.map{@sighting.photos.build}
		
	end

	def create
		@sighting = current_user.sightings.build(params[:sighting])
		#@sighting = Sighting.new(params[:sighting])
		if @sighting.save
			redirect_to sightings_path
		else
			render :new
		end
	end

	def edit
		@sighting = Sighting.find(params[:id])
		@json = Sighting.find(params[:id]).to_gmaps4rails
		@photos = 3.times.map{@sighting.photos.build}

	end

	def update
		@sighting = Sighting.find(params[:id])
		if @sighting.update_attributes params[:sighting]
			redirect_to sightings_path
		else
			render :edit
		end
	end

	def destroy
		@sighting = Sighting.find(params[:id])
		@sighting.destroy
			redirect_to sightings_path
	end

	def show
		@sighting = Sighting.find(params[:id])
		@json = Sighting.find(params[:id]).to_gmaps4rails

	end


end
