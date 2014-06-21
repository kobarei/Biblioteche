class AdminController < ActionController::Base
  include Biblio::Subdomain
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_staff
    @current_staff ||= Staff.find(session[:staff_id]) if session[:staff_id]
  end

  def current_library
    @current_library ||= Library.find_by subdomain: request.subdomain
  end

  helper_method :current_staff
  helper_method :current_library

end
