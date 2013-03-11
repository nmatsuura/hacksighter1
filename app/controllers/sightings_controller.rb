class SightingsController < ApplicationController

	def index
		@sightings = Sighting.includes(:comments).all
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

	def edit
		@sighting = Sighting.find(params[:id])
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
	end

end
