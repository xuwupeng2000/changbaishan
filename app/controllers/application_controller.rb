class ApplicationController < ActionController::Base
  include Pundit

  before_action :set_current_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  #ensure_security_headers

  def authenticate_user
    return if current_user

    toaster =  { message: 'Log in please.', type: 'success' }
    redirect_to new_user_session_path
  end

  def toaster=(hash)
    gon.toaster = hash
  end

  def set_current_user
    gon.current_user = current_user
  end

end
