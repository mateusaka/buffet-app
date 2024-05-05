Rails.application.routes.draw do
  devise_for :clients, path: 'clients'
  devise_for :buffet_owners, path: 'buffet_owners'
  root to: 'home#index'

  get '/unauthorized', to: 'errors#unauthorized'

  resources :events, only: [:index, :new, :create, :show]
  resources :orders, only: [:index, :show] do
    member do
      get 'show_details_to_buffet_owner'
      get 'confirm'
      put 'confirm_update'
    end

    collection do
      get 'show_to_buffet_owner'
    end
  end
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
