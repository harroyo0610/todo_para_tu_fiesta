Rails.application.routes.draw do
  #devise_for :users
  root 'partys#index'
  get     '/signup',   to:  'users#new'
  get    'packages'  => 'packages#index'
  get     '/login',    to:  'sessions#new'
  post    '/login',    to:  'sessions#create'
  delete  '/logout',   to:  'sessions#destroy'
<<<<<<< HEAD
  
  #get '/contacts',     to: 'contacts#new'
  resources "contacts", only: [:new, :create]
=======
<<<<<<< HEAD
>>>>>>> d527ea55a307e3baff05aa1c49d667b6cbb886d4
  resources :partys
  resources :packages do
    resources :tickets
  end
=======
  resources :packages
  resources :partys
  resources :tickets
>>>>>>> e67bc5bf1f2bc2c7dbdfa817d49d58142e5695c5
  resources :users 
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]

end



