Rails.application.routes.draw do
  devise_for :accounts

  root to: "static_pages#homepage"

  get "/dashboard",         to: "accounts#index"
  get "profile/:username",  to: "accounts#profile", as: :profile
  #get "post/like/:post_id", to: "likes#save_like",  as: :like_post  

  resources :posts, only: [:new, :create, :show]

  resources :likes, only: [:create, :destroy]
end
