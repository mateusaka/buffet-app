Rails.application.routes.draw do
  devise_for :buffet_owners, path: 'buffet_owners'
  root to: 'home#index'

  resources :buffets, only: [:new, :create, :show, :edit, :update]
end
