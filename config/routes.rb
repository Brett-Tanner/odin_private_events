Rails.application.routes.draw do
  devise_for :users
  resources :events, only: [:index]

  # Defines the root path route ("/")
  root "events#index"
end
