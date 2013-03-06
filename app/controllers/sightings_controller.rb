class SightingsController < ApplicationController

	def index
		@sightings = Sighting.all
	end

	def new
		@sighting = Sighting.new
	end

	def create
		@sighting = Sighting.new(params[:sighting])
		if 
			@sighting.valid?
			@sighting.save
			redirect_to sightings_path
		else
			render :new
		end
	end

end
