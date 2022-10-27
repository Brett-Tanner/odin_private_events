Rails.application.routes.draw do
  resources :users
  devise_for :users
  resources :events

  # Defines the root path route ("/")
  root "events#index"
end
