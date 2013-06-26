class VotesController < ApplicationController
  before_filter :login_required
  before_filter :load_votable
  
  def create 
    @vote = @votable.vote_for_user(current_user)
    @vote.attributes = { :sign => params[:sign] }
    if @vote.save
      redirect_to @votable, :notice => 'You have successfully placed a vote'
    else
      redirect_to @votable, :alert => 'There was a problem savng your vote'
    end
  end
  
  private
  
  def load_votable
    @votable = if params[:article_id].present?
      Article.find(params[:article_id])
    else
      Comment.find(params[:comment_id])
    end
  end
end
