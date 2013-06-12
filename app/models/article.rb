class Article < ActiveRecord::Base
  attr_accessible :title, :link
  validates :title, :link, :presence => true
  
  validate :link_is_a_valid_uri
  
  private
  
  def link_is_a_valid_uri
    unless URI.regexp(["http", "https"]) =~ link
      errors.add(:link, "must be a valid URI")
    end
  end
  
  def self.domain
    URI.parse(:link).host
  end
end