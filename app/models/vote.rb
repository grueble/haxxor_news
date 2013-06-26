class Vote < ActiveRecord::Base
  attr_accessible :sign

  validates :sign, :presence => true, :inclusion => { :in => [-1, 1] }
  validates :user_id, :uniqueness => { :scope => [:votable_id, :votable_type] }, :presence => true
  validates :votable_id, :votable_type, :presence => true
  
  belongs_to :votable, :polymorphic => true
  
  belongs_to :user
end