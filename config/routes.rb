Rails.application.routes.draw do
  resources :pages
  #resources :edit
  devise_for :users
  root 'pages#index'

  get 'home' => 'pages#home'

  get 'profile' => 'pages#profile'

  get 'news' => 'pages#news'
  get '/catalog' => 'pages#catalog'
  get 'single_item' => 'pages#single_item'

get 'edit/show'=> 'edit/show', as: 'edit'
get 'edit/create'=> 'edit/create', as: 'create'
get 'edit/new'=> 'edit/new', as: 'new'
post 'edit/create'=> 'edit/create', as: '_create'
post 'edit/new'=> 'edit/new', as: '_new'

  post 'edit/new' => 'edit/new', as: 'edit_new'
  patch 'edit/update' => 'edit/update', as: 'edit_update'

  get "edit/cat_editing/:id" => "edit#cat_editing", as: :cat_editing

  get 'edit/category/:id' => 'edit#category', as: 'category'
  get 'edit/subcategory' => 'edit/subcategory', as: 'subcategory'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
