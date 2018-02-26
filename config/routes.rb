Rails.application.routes.draw do

  resources :users
  resources :posts
  resources :comments

  root to: "posts#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'


end
