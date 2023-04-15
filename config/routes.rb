Rails.application.routes.draw do
  resources :issues
  resources :requests

  devise_for :users

  root 'dashboard#index'
  get '/', to: 'dashboard#index', as: 'dashboard'
end
