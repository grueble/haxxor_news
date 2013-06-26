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
    @votable = params[:article_id].present? ? load_article : load_comment
  end
end
