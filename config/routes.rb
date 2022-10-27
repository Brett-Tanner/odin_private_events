Rails.application.routes.draw do
  resources :events, only: [:index]

  # Defines the root path route ("/")
  root "events#index"
end
