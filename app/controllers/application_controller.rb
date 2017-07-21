class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


#strong parameters
before_action :configure_permitted_parameters, if: :devise_controller?
before_action :set_variables

def set_variables
  @categories=Category.all
  @subcategories=Subcategory.all
  @search_items=Item.all.search(params[:search])
end

protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up) do |u| u.permit(:email, :firstname, :lastname, :password, :password_confirmation, :remember_me, :avatar) end
  devise_parameter_sanitizer.permit(:sign_in) do |u| u.permit(:email, :email, :password, :remember_me) end
  devise_parameter_sanitizer.permit(:account_update) do |u| u.permit(:firstname, :lastname, :password, :password_confirmation, :current_password, :avatar) end
end

after_action :store_location

def store_location
  # store last url as long as it isn't a /users path
  session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
end

def after_sign_in_path_for(resource)
  session[:previous_url] || root_path
end

def after_sign_in_path_for(resource)
  session[:previous_url] || root_path
end
def after_sign_up_path_for(resource)
  session[:previous_url] || root_path
end




end
