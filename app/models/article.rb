class Article < ActiveRecord::Base
  attr_accessible :title, :link
  validates :link, :presence => true
  validates :title, :presence => true
end