class CommentsController < ApplicationController

	def create
		sighting = Sighting.find(params[:sighting_id])
		@comment = sighting.comments.build(params[:comment])
		if @comment.save
			redirect_to sightings_path
		else
			render 'new'
		end
	end


end
