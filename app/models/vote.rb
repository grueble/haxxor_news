class Vote < ActiveRecord::Base
  attr_accessible :sign

  validates :sign, :presence => true, :inclusion => { :in => [-1, 1] }
  validates :user_id, :uniqueness => { :scope => [:votable_id, :votable_type] }
  
  belongs_to :votable, :polymorphic => true
  
  belongs_to :user
end