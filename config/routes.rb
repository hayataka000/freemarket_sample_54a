Rails.application.routes.draw do
  root 'item#index'
  get '/confirm/index'
  devise_for :users
  resources :cards, only: [:index] do
  end

end
