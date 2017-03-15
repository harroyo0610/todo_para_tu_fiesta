Rails.application.routes.draw do
  root 'partys#index'
  resources :partys
end
