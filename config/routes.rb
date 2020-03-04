Rails.application.routes.draw do
  get '/', to: 'sessions#index'
  resources :orders, only: [:new, :show, :edit]
  resources :users, only: [:new, :show, :edit, :destroy] 
  resources :sessions, only: [:new, :destroy] 



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
