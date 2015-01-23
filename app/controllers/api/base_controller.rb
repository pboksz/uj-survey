class Api::BaseController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery :with => :null_session
  after_filter :set_csrf_cookie_for_angular

  def set_csrf_cookie_for_angular
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end
end
