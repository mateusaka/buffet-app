Rails.application.routes.draw do
  devise_for :buffet_owners, path: 'buffet_owners'
  root to: 'home#index'

  get '/unauthorized', to: 'errors#unauthorized'

  resources :buffets, only: [:new, :create, :show, :edit, :update]
  resources :events, only: [:index, :new, :create, :show]
end
