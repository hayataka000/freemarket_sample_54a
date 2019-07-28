Rails.application.routes.draw do
  root 'item#index'


  get  'item/items'     =>  'item#items'
  get  'item/show'      =>  'item#show'
  get  'item/:id/edit'   =>'item#edit'
  patch '/item/:id/edit'  => 'item#update'
  patch '/item'  =>  'item#update'
  resources :profile, only: [:index]
  resources :cards, only: [:index, :new]

  # resources :sign_up do
  #   collection do
  #     get 'index'
  #   end
  # end
  
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
    get 'sign_out', to: 'devise/sessions#destroy'
  end
  resources :edit,only: [:update,:index]
  resources :cards, only: [:index] do
  end
  resources :mypages,only:[:index] 
  resources :exhibition,only:[:index]
  resources :confirm, only: [:index] do
  end
  resources :profile, only: [:index] do
  end


  resources :item, only: [:new,:create,:update] do

  end
end
