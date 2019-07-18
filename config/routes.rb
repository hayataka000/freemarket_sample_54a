Rails.application.routes.draw do
  root 'item#index'
  resources :mypages,only:[:index]
end
