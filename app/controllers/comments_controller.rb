class CommentsController < ApplicationController
  before_filter :login_required, :only => [ :create ]
  before_filter :load_commentable, :only => [ :create ]
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  def create
    @comment = current_user.comments.build(params[:comment])
    if @comment.save
      redirect_to @commentable, :notice => "You have successfully posted a comment"
    else
      redirect_to @commentable, :alert => "Comment must have text"
    end
  end
  
  private
  
  def load_commentable
    @commentable = params[:comment][:commentable_type].constantize.find(params[:comment][:commentable_id])
  end
end
