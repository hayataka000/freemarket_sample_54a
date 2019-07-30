Rails.application.routes.draw do
  root 'item#index'
  get  'item/items'     =>  'item#items'
  get '/item/show/:id', to: 'item#show'
  get '/user/show/:id', to: 'user#show'
  resources :profile, only: [:index]
  resources :cards, only: [:index, :new]
  resources :item, only: [:create,:new,:update,:edit,:show] 
  resources :exhibition,only: [:edit]
  post '/done'=> "item#_done"
  get '/product_purchase_confirmation'=> "item#_product_purchase_confirmation"
  get '/item/new', to: 'item#new'
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
    delete 'sign_out', to: 'devise/sessions#destroy'
    get 'sign_in_index', to: 'users/sessions#index'
  end

  resources :cards, only: [:index] do
  end
  resources :mypages,only:[:index]

  resources :exhibition,only:[:index]
  resources :confirm, only: [:index] 

  resources :profile, only: [:index] do
  end
  resources :item, only: [:create,:edit,:destroy] do


    member do
      post 'pay', to: 'item#pay'
    end
  end

  resources :purchase_confirmation, only: [:index] do  #nishimura2
  end
  
  resources :logout, only: [:index] do
  end
  resources :purchase_confirmation, only: [:index] do  #nishimura2
  end
end



