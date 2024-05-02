Rails.application.routes.draw do
  devise_for :clients, path: 'clients'
  devise_for :buffet_owners, path: 'buffet_owners'
  root to: 'home#index'

  get '/unauthorized', to: 'errors#unauthorized'

  resources :events, only: [:index, :new, :create, :show]
  resources :orders, only: [:index, :show]
  resources :buffets, only: [:index, :new, :create, :show, :edit, :update] do
    resources :orders, only: [:new, :create]

    member do
      get 'show_to_guest'
    end

    collection do
      get 'search'
    end
  end
end
