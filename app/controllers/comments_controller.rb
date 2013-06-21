class CommentsController < ApplicationController
  before_filter :login_required, :only => [ :create ]
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  def create
    comment = current_user.comments.build(params[:comment])
    if comment.save
      redirect_to comment.commentable, :notice => "You have successfully posted a comment"
    else
      if comment.commentable
        redirect_to comment.commentable, :alert => "Comment must have text"
      else
        redirect_to root_url, :alert => "We weren't able to save your comment at this time"
      end
    end
  end
end
