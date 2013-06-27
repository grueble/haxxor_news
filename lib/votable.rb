module Votable
  extend ActiveSupport::Concern
  
  included do
    has_many :votes, :as => :votable
  end
  
  def vote_for_user(user)
    votes.where({:user_id => user.id}).first_or_initialize
  end
  
  def score
    votes.sum("sign")
  end
end
