class CommentsController < ApplicationController
  before_filter :login_required, :only => [ :new, :create ]
  
  def new
    @comment = Comment.new
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  def create
    @article = Article.find(params[:article_id])
    @comment = current_user.comments.build(params[:comment])
    @comment.commentable = @article
    if @comment.save
      redirect_to @article, :notice => "You have successfully posted a comment"
    else
      render 'articles/show'
    end
  end
end
