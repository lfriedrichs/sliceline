Rails.application.routes.draw do
  get '/', to: 'sessions#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout/:id', to: 'sessions#destroy'
  delete '/users/:id', to: 'users#destroy'
  get '/users/:id/orders', to: 'users#orders'
  post '/sessions/:user_id/:item_id', to: 'sessions#add'
  delete '/sessions/:user_id/:item_id', to: 'sessions#remove'
  get '/sessions/:user_id/cart', to: 'sessions#cart'
  resources :orders, only: [:show, :new, :create, :update]
  resources :users, only: [:edit, :show, :update, :new, :create] 
  resources :locations, only: :index



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
