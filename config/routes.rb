Bookshop::Application.routes.draw do

  resources :sessions

  resources :users

  resources :user_types

  get :login , to: "sessions#new"    , as: :login
  
  get :logout, to: "sessions#destroy", as: :logout
  
  get :signup, to: "users#new"       , as: :signup
  
  match 'pages/:id' => 'pages#show'

  root :to => 'pages#home'
end
