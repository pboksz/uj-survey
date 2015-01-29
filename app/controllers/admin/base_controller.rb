class Admin::BaseController < ApplicationController
  before_action :authenticate_admin!
  def authenticate_admin!
    redirect_to admin_login_path unless current_admin
  end

  def create_admin_session(admin)
    @current_admin = admin
    session[:admin_id] = admin.id.to_s
  end

  def destroy_admin_session
    @current_admin = nil
    session[:admin_id] = nil
  end
end
