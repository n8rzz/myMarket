Rails.application.routes.draw do
  get 'users/new'

#  resources :users

  root 'static_pages#home'

  match '/dashboard',   to: 'static_pages#dashboard',     via: 'get'
  match '/help',        to: 'static_pages#help',          via: 'get'
  match '/calculators', to: 'static_pages#calculators',   via: 'get'
  match '/top10',		to: 'static_pages#top10',		  via: 'get'
  match '/about',		to: 'static_pages#about',		  via: 'get'
end
