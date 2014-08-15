Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:edit, :update]
  resources :activity_types, only: [:new, :create, :show]

  get '/dashboard', to: 'users#dashboard', as: 'dashboard'
  get '/signin', to: 'sessions#new', as: 'signin'

  get "/auth/:provider/callback" => "sessions#create"
end
