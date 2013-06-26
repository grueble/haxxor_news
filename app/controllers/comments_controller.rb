class CommentsController < ApplicationController
  before_filter :login_required, :only => [ :create ]
  before_filter :load_parent, :only => [ :create ]
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  def create
    @comment = @parent.comments.build(params[:comment])
    @comment.user = current_user
    if @comment.save
      redirect_to @parent, :notice => "You have successfully posted a comment"
    else
      redirect_to @parent, :alert => "Comment must have text"
    end
  end
end