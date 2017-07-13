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

  get '/edit/alter' => 'edit/alter', as: 'edit_alter'
  post 'edit/new' => 'edit/new', as: 'edit_new'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
