Rails.application.routes.draw do
  devise_for :accounts

  get "/dashboard",        to: "accounts#index"
  delete "/logout",        to: "devise/sessions#destroy"
  get "profile/:username", to: "accounts#profile", as: :profile

  resources :posts, only: [:new, :create, :show]

  root to: "static_pages#homepage"

end
