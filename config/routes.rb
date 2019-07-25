Rails.application.routes.draw do
  root 'item#index'

  get  'item/items'     =>  'item#items'
  get  'item/show'      =>  'item#show'
  get '/item/show/:id', to: 'item#show'
  get '/user/show/:id', to: 'user#show'
  resources :profile, only: [:index]
  resources :cards, only: [:index]

  get '/confirm/index'
  devise_for :users
  resources :cards, only: [:index] do
  end
  resources :mypages,only:[:index]
  resources :exhibition,only:[:index]
  resources :confirm, only: [:index] do
  end
  resources :profile, only: [:index] do
  end

  resources :item, only: [:new,:create] do

  end
end
