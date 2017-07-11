Rails.application.routes.draw do
  resources :edit
  devise_for :users
  root 'pages#index'

  get 'pages/home' => 'pages#home'

  get 'pages/profile' => 'pages#profile'

  get 'pages/news' => 'pages#news'
  get 'pages/catalog' => 'pages#catalog'
  get 'pages/single_item' => 'pages#single_item'
  post 'edit/new' => 'edit/new', as: 'edit_neww'
  get 'edit/new' => 'edit/new', as: 'edit_new'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
