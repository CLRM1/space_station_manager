Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/space_stations', to: 'space_station#index'
  get '/space_stations/:id', to: 'space_station#show'
  get '/astronauts', to: 'astronaut#index'
end
