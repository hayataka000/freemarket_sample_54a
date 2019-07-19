Rails.application.routes.draw do
  root 'item#index'

  get  'item/items'     =>  'item#items'
  get  'item/show'      =>  'item#show'
  resources :profile, only: [:index]
  resources :cards, only: [:index]

  get '/confirm/index'
  devise_for :users
  resources :cards, only: [:index] do
  end

  resources :confirm, only: [:index] do
  end
  resources :profile, only: [:index] do
  end

  resources :item, only: [:new] do
  end

end
