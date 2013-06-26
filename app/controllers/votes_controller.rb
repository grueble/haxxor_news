class VotesController < ApplicationController
  before_filter :login_required
  before_filter :load_votable
  
  def create 
    @vote = @votable.vote_for_user(current_user)
    if @vote.update_attributes(:sign => params[:sign])
      flash[:notice] = 'You have successfully placed a vote'
    else
      flash[:alert] = 'There was a problem saving your vote'
    end
    redirect_to @votable
  end
  
  private
  
  def load_votable
    @votable = load_parent
  end
end
