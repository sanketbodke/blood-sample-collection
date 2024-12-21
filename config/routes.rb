Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "registrations"
  }
  resources :users, only: [ :update ]
  resources :labs, only: [ :create, :update ]

  root "home#index"
  get "users/profile", to: "home#profile", as: :profile
end
