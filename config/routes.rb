Rails.application.routes.draw do
  root 'static_pages#home'
# match '/dashboard',   to: 'static_pages#dashboard',     via: 'get'
  match '/help',        to: 'static_pages#help',          via: 'get'
  match '/calculators', to: 'static_pages#calculators',   via: 'get'
  match '/about',		    to: 'static_pages#about',    		  via: 'get'
  match '/signup',	   	to: 'users#new',				          via: 'get'
  match '/login',       to: 'sessions#new',               via: 'get'
  match '/login',       to: 'sessions#create',            via: 'post'
  match '/logout',      to: 'sessions#destroy',           via: 'delete'

  resources :users
  resources :account_activations, only: [:edit]
  
  get 'sessions/new'
  get 'users/new'
end
