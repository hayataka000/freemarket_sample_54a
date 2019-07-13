Rails.application.routes.draw do
  root 'item#index'
  
  get 'cards', to: 'cards#index'
end
