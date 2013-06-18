class UsersController < ApplicationController
  before_filter :logout_required, :only => [:create, :new]
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @articles = @user.articles.page(params[:page]).per(20)
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
