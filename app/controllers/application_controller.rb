class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :login_required

  helper_method :current_user

  private
  
  def current_user
    @current_user ||= session[:current_user_id] &&
      User.find_by_id(session[:current_user_id])
  end
  
  def login_required
    unless session[:current_user_id] != nil
      flash.now[:alert] = "You must be logged in to perform this action"
      redirect_to new_session_path
    end
  end
end
