class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_admin?

  def current_user
    Admin.find_by(id: session[:admin])
  end
  helper_method :current_user

  private
  def check_admin?
    if request.subdomain.downcase == "admin"
      redirect_to sign_in_path unless current_user
    end
  end
end
