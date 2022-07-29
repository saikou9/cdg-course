Rails.application.routes.draw do
  devise_for :accounts

  get "/dashboard" => "accounts#index"

  resources :posts, only: [:new, :create, :show]

  root to: "static_pages#homepage"
end
