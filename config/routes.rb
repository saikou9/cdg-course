Rails.application.routes.draw do
  devise_for :accounts

  root to: "static_pages#homepage"

  get "/dashboard",        to: "accounts#index"
  get "profile/:username", to: "accounts#profile", as: :profile

  resources :posts, only: [:new, :create, :show]
end
