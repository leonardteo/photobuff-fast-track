class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :user_signed_in?, :current_user

  def user_signed_in?
    session[:user_id] != nil
  end

  # Returns the currently signed in user
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  # Require a login
  def require_login
    if !user_signed_in?
      flash[:error] = "Please login to post a photo!"
      redirect_to login_path
    end
  end

end
