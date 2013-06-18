class Article < ActiveRecord::Base
  attr_accessible :title, :link
  validates :title, :link, :user_id, :presence => true
  
  validate :link_is_a_valid_uri
  
  paginates_per 20

  scope :by_created_at, order("created_at DESC")
  
  belongs_to :user

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