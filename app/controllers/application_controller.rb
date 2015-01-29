class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_admin
  def current_admin
    @current_admin ||= admins_repository.find(session[:admin_id]) if session[:admin_id]
  end

  private

  def admins_repository
    @admins_repository ||= AdminsRepository.new(Admin)
  end
end
