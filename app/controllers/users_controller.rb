class UsersController < ApplicationController
  before_filter :logout_required, :only => [:create, :new]
  
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
      sign_in(@user)
    else
      render "new"
    end
  end
end
