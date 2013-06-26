class VotesController < ApplicationController
  before_filter :login_required
  before_filter :load_votable
  
  def create 
    @vote = @votable.vote_for_user(current_user)
    @vote.attributes = { :sign => params[:sign] }
    if @vote.save
      flash[:notice] = 'You have successfully placed a vote'
    else
      flash[:alert] = 'There was a problem saving your vote'
    end
    redirect_to @votable
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
