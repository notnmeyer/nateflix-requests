Rails.application.routes.draw do
  resources :issues
  resources :requests

  devise_for :users, skip: :all
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
    post 'sign_in', to: 'devise/sessions#create', as: :user_session
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  root 'dashboard#index'
  get '/', to: 'dashboard#index', as: 'dashboard'
end
