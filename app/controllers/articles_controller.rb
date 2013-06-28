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
    @articles = if params[:sort] == "rating"
      if params[:day]
        Article.for_date_range(Time.new(params[:year], params[:month], params[:day]).all_day).by_rating.page(params[:page])
      elsif params[:month]
        Article.for_date_range(Time.new(params[:year], params[:month]).all_month).by_rating.page(params[:page])
      elsif params[:day]
        Article.for_date_range(Time.new(params[:year]).all_year).by_rating.page(params[:page])
      else
        Article.by_rating.page(params[:page])
      end
    else
      Article.by_created_at.page(params[:page])
    end
  end
end