Rails.application.routes.draw do
  
  root 'static_pages#home'
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :rooms
  get '/reservation', to: 'rooms#reserve'
end
