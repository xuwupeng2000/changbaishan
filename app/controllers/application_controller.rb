class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  #ensure_security_headers

  def authenticate_user
    return if current_user

    flash[:error] = 'Log in please.'
    redirect_to new_user_session_path
  end
end
