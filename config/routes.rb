Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/admirals', to: 'admirals#index'
  get '/ships', to: 'ships#index'
  get '/admirals/:id', to: 'admirals#show'
  get '/ships/:id', to: 'ships#show'
  get 'admirals/:id/ships', to: 'admiral_ships#ships_index'
end
