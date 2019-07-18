Rails.application.routes.draw do
  root 'item#index'
  get 'item/new'  =>  'item#new'


end

