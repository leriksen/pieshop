Bookshop::Application.routes.draw do

  resources :sessions

  resources :users

  resources :user_types

  get :login , to: "sessions#new"    , as: :login
  
  get :logout, to: "sessions#destroy", as: :logout
  
  get :signup, to: "users#new"       , as: :signup
  
  get :about  , to: "pages#about"     , as: :about
  get :legal  , to: "pages#legal"     , as: :legal
  get :contact, to: "pages#contact"   , as: :contact
  get :privacy, to: "pages#privacy"   , as: :privacy
  
  match 'pages/:id' => 'pages#show'

  root :to => 'pages#home'
end
