Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  root 'home#index'
  get 'profile', to: 'home#profile', as: :profile
end
