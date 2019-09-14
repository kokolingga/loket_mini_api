class TicketsController < ApplicationController
  before_action :set_event
  before_action :set_event_ticket, only: [:show]

  # GET /events/:event_id/tickets
  def index
    json_response(@event.tickets)
  end

  # GET /events/:event_id/tickets/:id
  def show
    json_response(@ticket)
  end

  # POST /events/:event_id/tickets
  def create
    @event.tickets.create!(ticket_params)
    json_response(@event, :created)
  end

  # POST /event/ticket/create
  def create_by_event_id
    @event.tickets.create!(ticket_params_by_event_id)
    json_response(@event, :created)
  end

  private

  def ticket_params_by_event_id
    params.permit(:event_id, :name, :amount, :price, :description, :sale_start_date, :sale_end_date)
  end

  def ticket_params
    params.permit(:name, :amount, :price, :description, :sale_start_date, :sale_end_date)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_event_ticket
    @ticket = @event.tickets.find_by!(id: params[:id]) if @event
  end
end
