class VotesController < ApplicationController
  before_filter :login_required
  before_filter :load_parent
  
  def create 
    @vote = @parent.vote_for_user(current_user)
    if @vote.update_attributes(:sign => params[:sign])
      flash[:notice] = 'You have successfully placed a vote'
    else
      flash[:alert] = 'There was a problem saving your vote'
    end
    redirect_to @parent
  end
end