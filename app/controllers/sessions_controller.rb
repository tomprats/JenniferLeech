class SessionsController < ApplicationController
  skip_before_action :check_admin?

  def sign_in
    redirect_to admins_path if current_user
  end

  def save
    admin = Admin.find_by(email: params[:admin][:email])
    if admin && admin.authenticate(params[:admin][:password])
      session[:admin] = admin.id
      redirect_to admins_path
    else
      redirect_to sign_in_path
    end
  end

  def sign_out
    session[:admin] = nil
    redirect_to sign_in_path
  end
end
