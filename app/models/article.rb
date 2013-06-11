class Article < ActiveRecord::Base
  attr_accessible :title, :link
  validates :title, :link, :presence => true
end