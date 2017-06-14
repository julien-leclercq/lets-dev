class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def after_sign_in_path_for(resource)
    manager_dashboard_index_path
  end

  private
  def authenticate_admin_user!
    authenticate_user!
    redirect_to root_path, alert: "Unauthorized Access!" unless current_user.admin?
  end

  def set_locale
    I18n.locale = current_user.try(:locale) || cookies.try(:locale) || I18n.default_locale
  end

end
