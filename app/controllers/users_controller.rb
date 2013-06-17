class UsersController < ApplicationController
  skip_before_filter :login_required, :only => [:new, :show, :create]
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user, :notice => "You have succesfully created an account"
    else
      render "new"
    end
  end
end
