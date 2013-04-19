class TopicsController < ApplicationController

	before_filter :authenticate_user!

	def new
		@topic = Topic.new

		@q = Sighting.search(params[:q])
					@sightings = @q.result
		
	end


	def create
		
		@topic = Topic.new params[:topic]
		#@topic.user = current_user
		#@topic = topics.build(params[:topic])
		if @topic.save
			redirect_to sightings_path
		else
			render 'new'
		end
	end


end
