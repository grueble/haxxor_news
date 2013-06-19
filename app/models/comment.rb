class Comment < ActiveRecord::Base
  attr_accessible :body
  
  belongs_to :commentable, :polymorphic => true
  
  belongs_to :user
  
  validates :body, :user_id, :commentable_id, :commentable_type, :presence => true
  
  has_many :comments, :as => :commentable
end
