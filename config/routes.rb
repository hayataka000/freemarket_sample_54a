Rails.application.routes.draw do
  root 'item#index'
  resources :profile, only: [:index]
  
end
