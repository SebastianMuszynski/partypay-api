Rails.application.routes.draw do

  root 'root#index'
  post '/login',             to: 'users#login'
  post '/signup',            to: 'users#signup'
  post '/topup',             to: 'users#topup'
  post '/get_user_by_email', to: 'users#get_by_email'
  post '/pay',                to: 'users#pay'

  resources :users, only: [:show]

end
