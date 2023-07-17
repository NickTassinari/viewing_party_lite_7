# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'landing#index'

  # get '/register', to: 'users#new', as: 'register'
  get '/users/:user_id/movies/:movie_id/viewing-party/new', to: 'viewing_parties#new', as: 'new_viewing_party'
  get "/login", to: "users#login_form"
  post "/login", to: "users#login"
  # post '/users/:user_id/movies/:movie_id/viewing_parties', to: 'viewing_parties#create'
  
  resources :users, only: [:new, :create, :show] do
    resources :discover, only: [:index]
    resources :movies, only: [:index, :show]
    resources :viewing_parties, only: [:create]
  end

  get '/register', to: 'users#new'
end
