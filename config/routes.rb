Rails.application.routes.draw do
  root 'item#index'
  resources :cards, only: [:index]

end
