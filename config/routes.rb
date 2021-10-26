Rails.application.routes.draw do
  resources :users
  post '/login', to: 'authentication#login'
  get '/users/:id', to: 'users#show'
  get '/users', to: 'users#index'
  post '/register', to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
