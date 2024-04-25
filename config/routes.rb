Rails.application.routes.draw do
  devise_for :buffet_owners, path: 'buffet_owners'
  root to: 'home#index'

  get '/unauthorized', to: 'errors#unauthorized'

  resources :buffets, only: [:index, :new, :create, :show, :edit, :update]
  get '/buffets/:id/guest', to: 'buffets#show_to_guest', as: 'show_to_guest'

  resources :events, only: [:index, :new, :create, :show]
end
