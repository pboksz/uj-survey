class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_login_path(locale = nil)
    admin_surveys_path(locale)
  end

  def after_logout_path(locale = nil)
    root_path(locale)
  end
end
