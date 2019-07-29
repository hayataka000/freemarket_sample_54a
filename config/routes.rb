Rails.application.routes.draw do
  root 'item#index'
  get  'item/items'     =>  'item#items'
  get  'item/show'      =>  'item#show'
  get '/item/show/:id', to: 'item#show'
  get '/user/show/:id', to: 'user#show'
  resources :profile, only: [:index]
  resources :cards, only: [:index, :new]

  post '/done'=> "item#_done"
  get '/product_purchase_confirmation'=> "item#_product_purchase_confirmation"
  get '/item/new/:id', to: 'item#new'
  get '/confirm/index'
  get '/registrations/new' => 'registrations#new'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :omniauth_callbacks => 'users/omniauth_callbacks'
  }
  devise_scope :user do
    get 'sign_up', to: 'users/registrations#new'
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_in_index', to: 'users/sessions#index'
    get 'sign_out', to: 'devise/sessions#destroy'
  end

  resources :cards, only: [:index] do
  end
  resources :mypages,only:[:index] 
  resources :exhibition,only:[:index]
  resources :confirm, only: [:index] do
  end
  resources :profile, only: [:index] do
  end

  resources :item, only: [:create] do
    member do
      post 'pay', to: 'item#pay'
    end
  end
  resources :purchase_confirmation, only: [:index] do  #nishimura2
  end
  resources :logout, only: [:index] do  #koyama2
  end
end