class LocationsController < ApplicationController
  before_action :set_location, only: [:show]

  def index
    @locations = Location.all
    json_response(@locations)
  end

  def show
    json_response(@location)
  end

  def create
    @location = Location.create!(location_params)
    json_response(@location, :created)
  end

  private

  def location_params
    # whitelist params
    params.permit(:name, :address, :city, :google_map_url)
  end

  def set_location
    @location = Location.find(params[:id])
  end
end
