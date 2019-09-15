Rails.application.routes.draw do
  # Location
  get  '/locations',                          to: 'locations#index'
  get  '/locations/:id',                      to: 'locations#show'
  post '/location/create',                    to: 'locations#create'

  # Event
  get  '/locations/:location_id/events',      to: 'events#index'
  get  '/locations/:location_id/events/:id/get_info',  to: 'events#get_info'
  get  '/locations/:location_id/events/:id',  to: 'events#show'
  post '/locations/:location_id/events',      to: 'events#create'
  post '/event/create',                       to: 'events#create_by_location_id'

  # Ticket
  get  '/events/:event_id/tickets',           to: 'tickets#index'
  get  '/events/:event_id/tickets/:id',       to: 'tickets#show'
  post '/events/:event_id/tickets',           to: 'tickets#create'
  post '/event/ticket/create',                to: 'tickets#create_by_event_id'

  # Customer
  get  '/customers',                          to: 'customers#index'
  get  '/customers/:id',                      to: 'customers#show'
  post '/customer/create',                    to: 'customers#create'

  # Transaction
  post '/transaction/purchase',               to: 'transactions#purchase'
  post '/transaction/check_ticket_quota',     to: 'transactions#check_ticket_quota'
  get '/transaction/get_info/:customer_id',   to: 'transactions#get_info'
end
