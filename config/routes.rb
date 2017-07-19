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
  patch 'edit/updates' => 'edit/updates', as: 'edit_updates'

  get "edit/cat_editing/:id" => "edit#cat_editing", as: :cat_editing
  delete "edit/category/:id" => "edit#category", as: :cat_editing_delete
  delete "edit/subcategory/:id" => "edit#subcategory", as: :subcat_editing_delete

  get 'edit/category/:id' => 'edit#category', as: 'category'
  get 'edit/subcategory' => 'edit/subcategory', as: 'subcategory'


  get 'items_edit/show'=> 'items_edit/show', as: 'items_edit'
  get 'items_edit/all_items'=> 'items_edit/all_items', as: 'all_items'

  post 'items_edit/create'=> 'items_edit/create', as: 'item_create'

  get 'items_edit/lang_create'=> 'items_edit/lang_create', as: 'lang_create'
  post 'items_edit/new_lang'=> 'items_edit/new_lang', as: 'new_lang'
  patch 'items_edit/edit_lang' => 'items_edit/edit_lang', as: 'edit_lang'
  delete "items_edit/language_del/:id" => "items_edit#language_del", as: :lang_delete



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
