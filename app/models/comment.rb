class Comment < ActiveRecord::Base
  attr_accessible :body, :commentable_id, :commentable_type
  
  belongs_to :commentable, :polymorphic => true
  belongs_to :article
  belongs_to :user
  has_many :comments, :as => :commentable
  
  validates :body, :user_id, :commentable_id, :commentable_type, :article_id, :presence => true
end
