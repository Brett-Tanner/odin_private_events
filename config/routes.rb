Rails.application.routes.draw do
  devise_for :users, path_prefix: "d"
  resources :users, only: [:index, :show]

  resources :events do
    resources :participant, only: [:create, :destroy]
  end

  # Defines the root path route ("/")
  root "events#index"
end
