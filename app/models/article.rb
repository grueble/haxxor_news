class Article < ActiveRecord::Base
  include Votable

  attr_accessible :title, :link
  validates :title, :link, :user_id, :presence => true
  
  validate :link_is_a_valid_uri

  scope :by_created_at, order("created_at DESC")
  scope :for_date_range, lambda { |date_range| where(:created_at => date_range) }
  
  belongs_to :user
  
  has_many :comments, :as => :commentable

  def self.by_rating
    join_sql = %q(LEFT JOIN "votes" ON "votes"."votable_id" = "articles"."id" AND "votes"."votable_type" = 'Article')
    order_sql = %q(
      CASE WHEN SUM(sign) IS NULL THEN 0
        ELSE SUM(sign)
      END DESC
    )
    joins(join_sql).group("articles.id").order(order_sql)
  end

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