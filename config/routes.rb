Rails.application.routes.draw do
  root 'item#index'

  get  'item/items'     =>  'item#items'
  get  'item/show'      =>  'item#show'
  get '/item/show/:id', to: 'item#show'
  get '/user/show/:id', to: 'user#show'
  resources :profile, only: [:index]
  resources :cards, only: [:index]
  get '/item/new/:id', to: 'item#new'
  get '/item/:id', to: 'item#create'
  devise_for :users
  resources :cards, only: [:index, :new] do   #koyama
  end

  resources :mypages,only:[:index]      #yamada
  resources :exhibition,only:[:index]
  resources :confirm, only: [:index] do #komatubara

  end
  resources :profile, only: [:index] do #hayashida
  end



  resources :item, only: [:create] do      #nishimura
  end
  resources :purchase_confirmation, only: [:index] do  #nishimura2
  end
  resources :logout, only: [:index] do  #koyama2

  end
end
