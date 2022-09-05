Rails.application.routes.draw do
  devise_for :accounts

  root to: "static_pages#homepage"

  get "/dashboard",         to: "accounts#index"
  get "profile/:username",  to: "accounts#profile", as: :profile
  post "follow/account",    to: "accounts#follow_account", as: :follow_account

 
  resources :posts, only: [:new, :create, :show]

  resources :likes, only: [:create, :destroy]
end
