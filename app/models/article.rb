class Article < ActiveRecord::Base
  attr_accessible :title, :link
  validates :title, :link, :presence => true
  
  validate :link_is_a_valid_uri

  scope :by_created_at, order("created_at DESC")

  def domain
    URI.parse(link).host
  end

  private
  
  def link_is_a_valid_uri
    unless URI.regexp(["http", "https"]) =~ link
      errors.add(:link, "must be a valid URI")
    end
  end
end