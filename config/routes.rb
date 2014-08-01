Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destory]

  get "/auth/:provider/callback" => "sessions#create"
end
