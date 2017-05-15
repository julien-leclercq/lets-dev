class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def authenticate_admin_user!
    authenticate_user!
    redirect_to root_path, alert: "Unauthorized Access!" unless current_user.admin?
  end
end
