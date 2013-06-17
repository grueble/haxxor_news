class ArticlesController < ApplicationController
  skip_before_filter :login_required, :only => [:new, :show, :create, :index]
  
  def new
    @article = Article.new
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to @article
    else
      render "new"
    end
  end
  
  def index
    @articles = Article.by_created_at
  end
end