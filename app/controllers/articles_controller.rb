class ArticlesController < ApplicationController  
  before_filter :login_required, :only => [:new, :create]
  
  def new
    @article = Article.new
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def create
    @article = current_user.articles.build(params[:article])
    if @article.save
      redirect_to @article
    else
      render "new"
    end
  end
  
  def index
    @articles = Article.order("created_at DESC").page(params[:page])
  end
end