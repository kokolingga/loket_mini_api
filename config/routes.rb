Rails.application.routes.draw do
  get '/locations', to: 'locations#index'
  get '/locations/:id', to: 'locations#show'
  post '/location/create', to: 'locations#create'

  get '/locations/:location_id/events', to: 'events#index'
  get '/locations/:location_id/events/:id', to: 'events#show'
  post '/locations/:location_id/events', to: 'events#create'
end
