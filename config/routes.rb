Rails.application.routes.draw do
  root 'item#index'
  get  'item/items'     =>  'item#items'
  get  'item/show'      =>  'item#show'
  
end
