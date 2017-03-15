Rails.application.routes.draw do
  root 'partys#index'
  resources :partys
  resources :packages
  get    'packages'  => 'packages#index'
end
