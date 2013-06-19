class CommentsController < ApplicationController
  before_filter :login_required, :only => [ :new, :create ]
  
  def new
    @comment = Comment.new
  end
  
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(params[:comment])
    if @comment.save
      redirect_to @article
    else
      render 'articles/show'
    end
  end
end
