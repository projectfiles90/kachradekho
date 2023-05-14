Rails.application.routes.draw do
  resources :users
  post '/login', to: 'authentication#login'
  post '/signup', to: 'users#create'
  # get '/*a', to: 'application#not_found'

  resources :products

end