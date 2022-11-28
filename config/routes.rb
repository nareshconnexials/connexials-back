Rails.application.routes.draw do
  # devise_for :admins, class_name: 'AdminUser', path: 'admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"

  namespace :admin do
    # Add dashboard for your models here
    resources :users
    resources :allowances
    # resources :employments
    # resources :deductions
    # resources :payslips
    # resources :leaves
    root to: "users#index"
  
  end

  namespace :users do
    post 'password/forgot', to: 'passwords#forgot'
    post 'password/reset', to: 'passwords#reset'
    resources :registration, only: [:create]
    resources :sessions, only: [:create]
    resources :profiles, only: [:show]
    resources :list, only: [:index]
    # resources :leaves
  end

  # namespace :admin do
  #   resources :admin, only: [:index, :create, :update, :destroy]
  # end

  resources :payslips
end
