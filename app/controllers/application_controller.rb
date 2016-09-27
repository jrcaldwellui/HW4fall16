class ApplicationController < ActionController::Base
  before_filter :set_current_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
  def set_current_user
    @current_user ||=	session[:session_token	] && User.find_by_session_token(session[:session_token])
    if @current_user
      puts("user session active")
    end
    
  end
end
