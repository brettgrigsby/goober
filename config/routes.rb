Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'welcome#index'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'

  resources :riders, only: [:new, :create, :show]
  resources :drivers, only: [:new, :create, :show]
  resources :rides, only: [:new, :create, :update]
  
  get '/updates/:id', to: 'updates#show'
  put '/updates/:id', to: 'updates#update'

end
