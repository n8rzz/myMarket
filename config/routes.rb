Rails.application.routes.draw do
  resources :users

  root 'static_pages#home'

  match '/dashboard',   to: 'static_pages#dashboard',     via: 'get'
  match '/help',        to: 'static_pages#help',          via: 'get'

  devise_for :users  
end
