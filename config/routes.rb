Rails.application.routes.draw do
  #devise_for :users
  root 'partys#index'
  get     '/signup',   to:  'users#new'
  get    'packages'  => 'packages#index'
  get     '/login',    to:  'sessions#new'
  post    '/login',    to:  'sessions#create'
  delete  '/logout',   to:  'sessions#destroy'
  resources :partys
  resources :packages do
    resources :tickets
  end
  resources :users 
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]

end



