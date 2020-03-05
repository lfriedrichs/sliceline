Rails.application.routes.draw do
  get '/', to: 'sessions#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout/:id', to: 'sessions#destroy'
  delete '/users/:id', to: 'users#destroy'
  get '/users/:id/orders', to: 'users#orders'
  resources :orders, only: [:show, :edit, :new]
  resources :users, only: [:edit, :show, :update, :new, :create] 



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
