Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :users do
    resources :registration, only: [:create]
    resources :sessions, only: [:create]
  end
end
