class ArticlesController < ApplicationController  
  before_filter :login_required, :only => [:new, :create]
  
  def new
    @article = Article.new
  end
  
  def show
    @article = Article.find(params[:id])
    @new_comment = Comment.new if logged_in?
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
    @articles = ArticleSorter.new(params).results.page(params[:page])
  end
end