class TopicsController < ApplicationController

	before_filter :authenticate_user!

	def new
		@topic = Topic.new
	end


	# def create
		
	# 	@topic = topic
	# 	@topic.user = current_user
	# 	if @comment.save
	# 		redirect_to sightings_path
	# 	else
	# 		render 'new'
	# 	end
	# end


end
