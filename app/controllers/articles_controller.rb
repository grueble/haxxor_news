class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def create
    @article = Article.create(params[:article])
    if @article.save
      redirect_to @article
    else
      render "new"
    end
  end
  
  def index
    @articles = Article.all.sort { 
      |a, b| a.id <=> b.id }
    respond_to (:html)
  end
end