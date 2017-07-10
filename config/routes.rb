Rails.application.routes.draw do

  root 'pages#index'

  get 'pages/home' => 'pages#home'

  get 'pages/profile' => 'pages#profile'

  get 'pages/news' => 'pages#news'
  get 'pages/catalog' => 'pages#catalog'
  get 'pages/single_item' => 'pages#single_item'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
