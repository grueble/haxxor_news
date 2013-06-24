class Comment < ActiveRecord::Base
  attr_accessible :body
  
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  has_many :comments, :as => :commentable
  
  validates :body, :user_id, :commentable_id, :commentable_type, :presence => true
end
