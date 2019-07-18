Rails.application.routes.draw do
<<<<<<< HEAD
  root 'item#index'
  get '/confirm/index'
  
=======
>>>>>>> master
  
  devise_for :users
  root 'item#index'
  resources :cards, only: [:index]

end
