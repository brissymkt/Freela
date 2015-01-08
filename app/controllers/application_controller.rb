class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Devise extra parameters
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :check_locale

  def after_sign_in_path_for(resource)
    locale_link_to("user_environmental_analyses")
  end
  private
  def check_locale
    I18n.default_locale = params[:locale].to_sym if I18n.default_locale != params[:locale].to_sym
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
