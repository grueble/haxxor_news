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
      render :action => "new"
    end
  end
  
end