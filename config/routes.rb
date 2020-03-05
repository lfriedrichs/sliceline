Rails.application.routes.draw do
  get '/', to: 'sessions#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout/:id', to: 'sessions#destroy'
  get '/new_user', to: 'users#new'
  post '/new_user', to: 'users#create'
  post '/users/:id/destroy', to: 'users#destroy'
  post '/users/:id/orders', to: 'users#orders'
  resources :orders, only: [:show, :edit, :new]
  resources :users, only: [:show, :edit] 



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
