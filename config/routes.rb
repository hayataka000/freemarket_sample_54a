Rails.application.routes.draw do
  root 'item#index'
  get '/confirm/index'
  devise_for :users
  resources :cards, only: [:index] do
  end
  resources :mypages,only:[:index]
  resources :confirm, only: [:index] do
  end
  resources :profile, only: [:index] do
  end
  resources :item, only: [:new] do
  end
end
