Rails.application.routes.draw do
  root "dashboard#index"

  resources :requests
  get "/", to: "dashboard#index", as: "dashboard_path"
end
