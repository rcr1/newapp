class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  #Devises way of whitelisting parameters that we add to the devise users table
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:signup) { |u| u.permit(:name, :stripe_card_token, :email, :password, :password_confirmaton) }
    end
end
