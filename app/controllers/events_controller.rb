class EventsController < ApplicationController
  before_action :set_location
  before_action :set_location_event, only: [:show]

  # GET /locations/:location_id/events
  def index
    json_response(@location.events)
  end

  # GET /locations/:location_id/events/:id
  def show
    json_response(@event)
  end

  # POST /locations/:location_id/events
  def create
    @location.events.create!(event_params)
    json_response(@location, :created)
  end

  # POST /event/create
  def create_by_location_id
    @location.events.create!(event_params_by_location_id)
    json_response(@location, :created)
  end

  private

  def event_params_by_location_id
    params.permit(:location_id, :name, :category, :event_type, :capacity, :organizer, :start_date, :end_date, :start_time, :end_time, :description)
  end

  def event_params
    params.permit(:name, :category, :event_type, :capacity, :organizer, :start_date, :end_date, :start_time, :end_time, :description)
  end

  def set_location
    @location = Location.find(params[:location_id])
  end

  def set_location_event
    @event = @location.events.find_by!(id: params[:id]) if @location
  end
end
