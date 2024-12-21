Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "registrations"
  }
  resources :users, only: [ :update ]
  resources :labs, only: [ :create, :update ]
  resources :addresses, only: [ :create, :update ]

  root "home#index"
  get "users/profile", to: "users#profile", as: :profile
end
