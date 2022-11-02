Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :users do
    post 'password/forgot', to: 'passwords#forgot'
    post 'password/reset', to: 'passwords#reset'
    resources :registration, only: [:create]
    resources :sessions, only: [:create]
    resources :profiles, only: [:show]
  end
end
