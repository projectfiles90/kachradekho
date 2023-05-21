Rails.application.routes.draw do
  resources :users
  post '/login', to: 'authentication#login'
  post '/signup', to: 'users#create'
  # get '/*a', to: 'application#not_found'

  # resources :products
  resources :notifications, only: [:index, :destroy]
  put '/notifications/:id/mark_as_read', to: 'notifications#mark_as_read'
  resources :products do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :update, :destroy]
  end

end