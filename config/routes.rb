Rails.application.routes.draw do
  devise_for :accounts

  root to: "static_pages#homepage"

  get "/dashboard",         to: "accounts#index"
  get "profile/:username",  to: "accounts#profile",          as: :profile
  get "profile/:username/total_followers",  to: "accounts#total_followers", as: :total_followers
  post "follow/account",    to: "accounts#follow_account",   as: :follow_account
  delete "unfollow/account",to: "accounts#unfollow_account", as: :unfollow_account
  delete "logout",          to: "sessions#destroy",          as: :destroy_account_session_path
  delete "/posts/id",       to: "posts#destroy",             as: :destroy_post

  resources :posts
  resources :likes,    only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
end
