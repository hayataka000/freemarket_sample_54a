Rails.application.routes.draw do
  root 'item#index'
  get'mypages'=> 'mypages#index'
end
