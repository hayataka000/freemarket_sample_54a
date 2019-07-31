Rails.application.routes.draw do
  root 'item#index'
  resources :profile, only: [:index]
  resources :cards, only: [:index, :new]
  resources :item, only: [:create,:new,:update,:edit,:show,:destroy] do
    member do
      post 'pay', to: 'item#pay'
    end
  end
  resources :exhibition,only: [:edit]

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
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
  get 'mypage/:id', to: 'mypages#index'
 
  resources :exhibition,only:[:index]
  
  resources :confirm, only: [:index] 

  resources :logout, only: [:index] do
  end
  
  resources :product_purchase_confirmation, only: [:edit] do
  end

end



