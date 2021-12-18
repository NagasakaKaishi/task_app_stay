Rails.application.routes.draw do
  
  root 'static_pages#home'
  
  resources :users do
    collection do
      get 'profile'
    end
  end
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :rooms do
    collection do
      get 'search'
    end
  end
  
  resources :reservations
  post '/confirm', to: 'reservations#confirm'
end
