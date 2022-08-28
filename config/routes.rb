Rails.application.routes.draw do
  devise_for :accounts

  get "/dashboard",        to: "accounts#index"
  get "profile/:username", to: "accounts#profile", as: :profile

  resources :posts, only: [:new, :create, :show]

  root to: "static_pages#homepage"

end
