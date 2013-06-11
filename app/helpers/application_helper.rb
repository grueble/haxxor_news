module ApplicationHelper
  def article_domain(article)
    URI.parse(article.link).host
  end
end
