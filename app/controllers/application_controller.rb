class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Devise extra parameters
  before_action :configure_permitted_parameters, if: :devise_controller?
  #Internationalization setup
  before_action :set_locale
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

	def set_locale
	 	I18n.locale = params[:locale] || I18n.default_locale
	end
end
