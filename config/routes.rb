Rails.application.routes.draw do
  root 'partys#index'
  get     '/signup',   to:  'users#new'
  get    'packages'  => 'packages#index'
  get     '/login',    to:  'sessions#new'
  post    '/login',    to:  'sessions#create'
  delete  '/logout',   to:  'sessions#destroy'
  
  #get '/contacts',     to: 'contacts#new'
  resources "contacts", only: [:new, :create]
  resources :packages do
    resources :tickets
  end
<<<<<<< HEAD
=======
  resources :partys
>>>>>>> c288aab1a0d56fee3403ad6651650cda2c8140ec
  resources :users 
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end



