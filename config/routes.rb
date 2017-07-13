Rails.application.routes.draw do
  resources :pages
  resources :edit
  devise_for :users
  root 'pages#index'

  get 'home' => 'pages#home'

  get 'profile' => 'pages#profile'

  get 'news' => 'pages#news'
  get '/catalog' => 'pages#catalog'
  get 'single_item' => 'pages#single_item'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
