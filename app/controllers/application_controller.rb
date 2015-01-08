class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Devise extra parameters
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :check_locale
  private
  def check_locale
    I18n.default_locale = params[:locale].to_sym if I18n.default_locale != params[:locale].to_sym
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
