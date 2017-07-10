class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


#strong parameters
before_action :configure_permitted_parameters, if: :devise_controller?

protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up) do |u| u.permit(:email, :firstname, :lastname, :password, :password_confirmation, :remember_me) end
  devise_parameter_sanitizer.permit(:sign_in) do |u| u.permit(:email, :email, :password, :remember_me) end
  devise_parameter_sanitizer.permit(:account_update) do |u| u.permit(:firstname, :lastname, :password, :password_confirmation, :current_password) end
end
end
