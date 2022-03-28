Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/space_stations', to: 'space_station#index'
  get 'space_stations/new', to: 'space_station#new'
  get '/space_stations/:id', to: 'space_station#show'
  get '/space_stations/:station_id/edit', to: 'space_station#edit'
  get '/astronauts', to: 'astronaut#index'
  get '/astronauts/:id', to: 'astronaut#show'
  get '/space_stations/:station_id/astronauts', to: 'space_station_astronaut#index'
  get '/space_stations/:station_id/astronauts/new', to: 'space_station_astronaut#new'
  post '/space_stations', to: 'space_station#create'
  post '/space_stations/:station_id/astronauts', to: 'astronaut#create'
  patch '/space_stations/:station_id', to: 'space_station#update'
end
