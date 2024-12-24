Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "registrations"
  }
  resources :users, only: [ :update ]
  resources :labs, only: [ :create, :update ]
  resources :addresses, only: [ :create, :update ]
  resources :agents

  root "home#index"
  get "users/profile", to: "users#profile", as: :profile
  get "/faqs", to: "high_voltage/pages#show", id: "faqs"
  get "/privacy-policy", to: "high_voltage/pages#show", id: "privacy-policy"
end
