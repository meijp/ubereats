Rails.application.routes.draw do
  devise_for :stores, controllers: {
  sessions:      'stores/sessions',
  passwords:     'stores/passwords',
  registrations: 'stores/registrations'
}
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

  root 'tops#index'
  resources :users
  resources :stores do
    resources :storetops, only: [:index, :new, :create, :edit]
    resources :products, shallow: true
  end

  resources :carts, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy, :new]

  resources :payments, only: [:index, :new, :update, :create] do
    collection do
      post 'purchase'
    end
  end

  resources :tops do
    collection do
      get 'search'
    end
  end

  resources :companies, only: [:index]

end
