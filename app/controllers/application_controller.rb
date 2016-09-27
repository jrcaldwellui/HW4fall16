class ApplicationController < ActionController::Base
  before_filter :set_current_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
  def set_current_user
    puts("Checking for session token: #{session[:session_token]}")
    @current_user ||=	session[:session_token	] && User.find_by_session_token(session[:session_token])
    if @current_user
      puts("user session active")
    else
      puts("No sessions")
    end
    
  end
end
