Rails.application.routes.draw do
  devise_for :users, path_prefix: "d"
  resources :users, only: [:index, :show]
  resources :events

  post "/participant/:id", to: "participant#create", as: "new_participant"

  # Defines the root path route ("/")
  root "events#index"
end
