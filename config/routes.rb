Rails.application.routes.draw do
  get 'users/dashboard'

  resources :sessions, only: [:new, :create, :destory]
  resources :users

  get '/dashboard', to: 'users#dashboard', as: 'dashboard'
  get '/signin', to: 'sessions#new', as: 'signin'

  get "/auth/:provider/callback" => "sessions#create"
end
