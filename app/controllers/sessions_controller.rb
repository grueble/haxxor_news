class SessionsController < ApplicationController
  before_filter :login_required, :only => [:destroy]
  before_filter :logout_required, :only => [:create, :new]
  
  def new; end
  
  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to root_url, :notice => "You have successfully been signed in"
    else
      flash.now[:alert] = "Invalid username/password combination"
      render "new"
    end
  end
  
  def destroy
    session[:current_user_id] = nil
    redirect_to root_url, :notice => "You have successfully been signed out"
  end
end
