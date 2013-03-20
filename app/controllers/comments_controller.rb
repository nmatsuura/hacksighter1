class CommentsController < ApplicationController

	before_filter :authenticate_user!

	def create
		sighting = Sighting.find(params[:sighting_id])
		@comment = sighting.comments.build(params[:comment])
		@comment.user = current_user
		if @comment.save
			redirect_to sightings_path
		else
			render 'new'
		end
	end


end
