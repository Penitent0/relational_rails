Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/admirals', to: 'admirals#index'
  get '/ships', to: 'ships#index'
  get '/admirals/new', to: 'admirals#new'
  get '/admirals/:id', to: 'admirals#show'
  get '/ships/:id', to: 'ships#show'
  get '/admirals/:id/ships', to: 'admiral_ships#ships_index'
  post '/admirals', to: 'admirals#create'
  get '/admirals/:id/edit', to: 'admirals#edit'
  patch '/admirals/:id', to: 'admirals#update'
end
