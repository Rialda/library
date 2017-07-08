Rails.application.routes.draw do
  
  root 'pages#index'

  get 'pages/home'

  get 'pages/profile'

  get 'pages/news'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
