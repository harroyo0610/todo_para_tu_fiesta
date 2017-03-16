Rails.application.routes.draw do
#<<<<<<< HEAD
  root 'partys#index'
  get     '/signup',   to:  'users#new'
#=======

  #root 'static_pages#home'
  # get     '/help',     to:  'static_pages#help'
  # get     '/about',    to:  'static_pages#about'
  # get     '/contact',  to:  'static_pages#contact'
  # get     '/signup',   to:  'users#new'
  root 'partys#index'
  resources :partys
  resources :packages
  get    'packages'  => 'packages#index'
#>>>>>>> 706895dad578e96ae70229d31091e65464bb20f8
  get     '/login',    to:  'sessions#new'
  post    '/login',    to:  'sessions#create'
  delete  '/logout',   to:  'sessions#destroy'
  
  resources :partys
  resources :users 
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]

#<<<<<<< HEAD

#=======
#>>>>>>> 706895dad578e96ae70229d31091e65464bb20f8
end



