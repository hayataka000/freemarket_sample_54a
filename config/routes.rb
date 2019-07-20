Rails.application.routes.draw do
  root 'item#index'

  get  'item/items'     =>  'item#items'
  get  'item/show'      =>  'item#show'

  devise_for :users
  resources :cards, only: [:index] do   #koyama
  end
  resources :mypages,only:[:index]      #yamada
  resources :confirm, only: [:index] do #komatubara
  end
  resources :profile, only: [:index] do #hayashida
  end
  resources :item, only: [:new] do      #nishimura
  end
  resources :purchase_confirmation, only: [:index] do  #nishimura2
  end
  resources :logout, only: [:index] do  #koyama2
  end
end
