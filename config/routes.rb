Rails.application.routes.draw do

  resources :users
  resources :posts do
    resources :comments
end

  root to: "posts#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'


end
