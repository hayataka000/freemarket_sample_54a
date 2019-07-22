Rails.application.routes.draw do
  root 'item#index'

  get  'item/items'     =>  'item#items'
  get  'item/show'      =>  'item#show'
  resources :profile, only: [:index]
  resources :cards, only: [:index]

  resources :sign_up do
    collection do
      get 'index'
    end
  end


  get '/confirm/index'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get 'sign_in' => 'users/sessions#new'
    get 'sign_out' => 'devise/sessions#destroy'
  end

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
