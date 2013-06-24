class CommentsController < ApplicationController
  before_filter :login_required, :only => [ :create ]
  before_filter :load_commentable, :only => [ :create ]
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  def create
    @comment = @commentable.comments.build(params[:comment])
    @comment.user = current_user
    if @comment.save
      redirect_to @commentable, :notice => "You have successfully posted a comment"
    else
      redirect_to @commentable, :alert => "Comment must have text"
    end
  end
  
  private
  
  def load_commentable
    @commentable = if params[:article_id].present?
      Article.find(params[:article_id])
    else
      Comment.find(params[:comment_id])
    end
  end
end