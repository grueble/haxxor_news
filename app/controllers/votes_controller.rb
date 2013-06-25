class VotesController < ApplicationController
  before_filter :load_votable, :only => [ :create, :destroy ]
  
  def create 
    @vote = @votable.votes.build(params[:vote])
    @vote.user = current_user
    if @vote.save
      redirect_to @votable
    end
  end
  
  def destroy
    if !(@votable.votes.empty?)
      @votable.votes.first.destroy
      redirect_to @votable
    else
      redirect_to root_url
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
