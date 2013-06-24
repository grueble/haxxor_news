class VotesController < ApplicationController
  before_filter :load_votable, :only => [ :create ]
  
  def create 
    @vote = @votable.votes.build(params[:vote])
    @vote.user = current_user
    if @vote.save
      redirect_to @votable
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
