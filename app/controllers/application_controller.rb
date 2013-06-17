class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?

  private
  
  def current_user
    @current_user ||= session[:current_user_id] &&
      User.find_by_id(session[:current_user_id])
  end
  
  def login_required
    unless logged_in?
      flash.now[:alert] = "You must be logged in to perform this action"
      redirect_to new_session_path
    end
  end
  
  def logged_in?
    current_user.present?
  end
  
  def logout_required
    unless !logged_in?
      flash.now[:alert] = "You must be logged out to perform this action"
      redirect_to root_url
    end
  end
end
