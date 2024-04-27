Rails.application.routes.draw do
  devise_for :buffet_owners, path: 'buffet_owners'
  root to: 'home#index'

  get '/unauthorized', to: 'errors#unauthorized'

  resources :buffets, only: [:index, :new, :create, :show, :edit, :update] do
    member do
      get 'show_to_guest'
    end

    collection do
      get 'search'
    end
  end

  resources :events, only: [:index, :new, :create, :show]
end
