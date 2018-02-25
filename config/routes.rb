Rails.application.routes.draw do

  resources :users do
    resources :posts do
      resources :comments
    end
end

  root to: "posts#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  # post '/logout', to: 'sessions#destroy'


end
