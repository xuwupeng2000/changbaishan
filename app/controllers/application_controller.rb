class ApplicationController < ActionController::Base
  include Pundit

  before_action :set_current_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  #ensure_security_headers

  def authenticate_user
    return if current_user

    flash[:alert] = 'Login please'
    redirect_to new_user_session_path
  end

  def toaster=(hash)
    gon.toaster = hash
  end

  def set_current_user
    gon.current_user = current_user
  end

  def js_redirect_to(path)
    render js: %(window.location.href='#{path}') and return
  end

end
