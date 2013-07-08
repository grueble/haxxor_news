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
      flash[:alert] = "You must be logged in to perform this action"
      redirect_to login_path
    end
  end
  
  def logged_in?
    current_user.present?
  end
  
  def logout_required
    if logged_in?
      flash[:alert] = "You must be logged out to perform this action"
      redirect_to root_url
    end
  end
  
  def sign_in(user)
    session[:current_user_id] = user.id
  end
  
  def load_parent
    @parent = params[:article_id].present? ? load_article : load_comment
  end
  
  def load_article
    Article.find(params[:article_id])
  end
  
  def load_comment
    Comment.find(params[:comment_id])
  end
end