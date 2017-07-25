Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  resources :pages
  #resources :edit
  devise_for :users
  root 'pages#index'

  get 'home' => 'pages#home'

  get 'profile' => 'pages#profile'

  get 'pages/news/:id' => 'pages#news', as: :news
  get '/catalog' => 'pages#catalog'
  get 'pages/single_item/:id' => 'pages#single_item', as: :single_item


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

#items_edit
  get 'items_edit/show'=> 'items_edit/show', as: 'items_edit'
  get 'items_edit/all_items'=> 'items_edit/all_items', as: 'all_items'

  post 'items_edit/create'=> 'items_edit/create', as: 'item_create'

  get 'items_edit/lang_create'=> 'items_edit/lang_create', as: 'lang_create'
  post 'items_edit/new_lang'=> 'items_edit/new_lang', as: 'new_lang'
  patch 'items_edit/edit_lang' => 'items_edit/edit_lang', as: 'edit_lang'
  delete "items_edit/language_del/:id" => "items_edit#language_del", as: :lang_delete

  get 'items_edit/tag_create'=> 'items_edit/tag_create', as: 'tag_create'
  post 'items_edit/new_tag'=> 'items_edit/new_tag', as: 'new_tag'
  patch 'items_edit/edit_tag' => 'items_edit/edit_tag', as: 'edit_tag'
  delete "items_edit/tag_del/:id" => "items_edit#tag_del", as: :tag_delete

  get "items_edit/item/:id" => "items_edit#item", as: :item
  patch 'items_edit/update' => 'items_edit/update', as: 'update'
  delete "items_edit/item_delete/:id" => "items_edit#item_delete", as: :item_delete


  #news
  get 'news/show'=> 'news/show', as: 'edit_news'
  get 'news/write_news'=> 'news/write_news', as: 'write_news'
  post 'news/create'=> 'news/create', as: 'news_create'
  get "news/single_news_edit/:id" => "news#single_news_edit", as: :single_news_edit

  patch 'news/update' => 'news/update', as: 'news_update'
  delete "news/single_news_delete/:id" => "news#single_news_delete", as: :single_news_delete


#Editing_Users
get 'editing_users/show'=> 'editing_users/show', as: 'editing_users'
get "editing_users/single_user/:id" => "editing_users#single_user", as: :single_user
get 'editing_users/reg_user'=> 'editing_users/reg_user', as: 'reg_user'
patch 'editing_users/update' => 'editing_users/update', as: 'single_user_update'
delete "editing_users/single_user_delete/:id" => "editing_users#single_user_delete", as: :single_user_delete
post 'editing_users/create'=> 'editing_users/create', as: 'editing_users_create'

#pages-categories-subcategories
get 'pages/category/:id'=> "pages#category", as: :selected_category
get 'pages/subcategory/:id'=> "pages#subcategory", as: :selected_subcategory

#cart
get 'cart/show/:id'=> "cart#show", as: :cart_show

#add to cart
post 'pages/create'=> 'pages/create', as: 'cartadd_create'
post 'pages/initcreate'=> 'pages/initcreate', as: 'cartadd_initcreate'

delete "cart/single_cart_item_delete/:id" => "cart#single_cart_item_delete", as: :single_cart_item_delete

get 'cart_line/show'=> 'cart_line/show', as: 'cart_line'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
