Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/admirals', to: 'admirals#index'

  delete '/admirals/:id', to: 'admirals#destroy'

  delete '/ships/:id', to: 'ships#destroy'

  get '/admirals/:id/ships/new', to: 'ships#new'

  post '/admirals/:id/ships', to: 'ships#create'

  get '/ships', to: 'ships#index'

  get '/ships/:id/edit', to: 'ships#edit'

  patch '/ships/:id', to: 'ships#update'

  get '/admirals/new', to: 'admirals#new'

  get '/admirals/:id', to: 'admirals#show'

  get '/ships/:id', to: 'ships#show'

  get '/admirals/:id/ships', to: 'admiral_ships#ships_index'

  post '/admirals', to: 'admirals#create'

  get '/admirals/:id/edit', to: 'admirals#edit'

  patch '/admirals/:id', to: 'admirals#update'

end
