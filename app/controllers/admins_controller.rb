class AdminsController < ApplicationController
  def index
    @admins = Admin.all
  end

  def create
    admin = Admin.create(admin_params)
    if admin.valid?
      render json: { status: 200, html: render_to_string(partial: "admins/row", locals: { admin: admin }, layout: false) }
    else
      render json: { status: 400, message: admin.errors.full_messages.join(", ") }
    end
  end

  def update
    admin = Admin.find_by(id: params[:id])
    if admin.update_attributes(admin_params)
      render json: { status: 200 }
    else
      render json: { status: 400, message: admin.errors.full_messages.join(", ") }
    end
  end

  def destroy
    admin = Admin.find_by(id: params[:id])
    if admin && admin.email != "tprats108@gmail.com"
      admin.destroy
      render json: { status: 200 }
    else
      render json: { status: 400, message: "Cannot delete superman" }
    end
  end

  private
  def admin_params
    params.require(:admin).permit(:email, :name, :password)
  end
end
