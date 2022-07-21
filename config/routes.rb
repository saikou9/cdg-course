Rails.application.routes.draw do
  devise_for :accounts
  root to: "static_pages#homepage"
end
