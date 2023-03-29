Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root "dashboard#index"

  resources :requests
  get "/", to: "dashboard#index", as: "dashboard_path"
end
