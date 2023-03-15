Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  
  # devise_for :admins, class_name: 'AdminUser', path: 'admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :admin_users
  resources :activity_logs

  namespace :admin do
    # Add dashboard for your models here
    resources :users
    resources :allowances
    resources :employments
    resources :deductions
    resources :payslips
    resources :timeoffs
    resources :clients
    resources :bank_details
    resources :timeoff_allocations
    resources :projects
    root to: "users#index"
    
  end

  namespace :users do
    post 'password/forgot', to: 'passwords#forgot'
    post 'password/reset', to: 'passwords#reset'
    resources :registration, only: [:create]
    resources :sessions, only: [:create]
    resources :profiles, only: [:show]
    resources :list, only: [:index]
    resources :timeoffs, only: [:create, :index]
    resources :timeoff_allocations
    resources :payslips
  end
  
  # namespace :admin do
  #   resources :admin, only: [:index, :create, :update, :destroy]
  # end

  # resources :payslips
end
