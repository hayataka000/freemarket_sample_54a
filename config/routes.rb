Rails.application.routes.draw do
  root 'item#index'
  get 'item/users'  =>  'item#users'


end

