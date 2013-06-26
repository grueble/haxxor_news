module Votable
  extend ActiveSupport::Concern
  
  included do
    has_many :votes, :as => :votable
  end
  
  def vote_for_user(user)
    votes.first_or_initialize({:user_id => user.id}, {:without_protection => true})
  end
  
  def score(votable)
    votable.votes.sum("sign")
  end
end
