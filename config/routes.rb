Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "registrations"
  }
  resources :users, only: [ :update ]
  resources :labs, only: [ :create, :update ]
  resources :addresses, only: [ :create, :update ]
  resources :agents
  resources :patient_appointments
  resources :patient_samples

  root "home#index"
  get "users/profile", to: "users#profile", as: :profile
  get "/faqs", to: "high_voltage/pages#show", id: "faqs"
  get "/privacy-policy", to: "high_voltage/pages#show", id: "privacy-policy"
  get "/service-map", to: "maps#service_map", as: "service_map"
end
