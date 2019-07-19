Rails.application.routes.draw do
  root 'item#index'
  resources :item, only: [:new]

end

