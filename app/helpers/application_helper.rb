module ApplicationHelper
  def commentable_comments_path(commentable)
    if commentable.is_a?(Article)
      article_comments_path(commentable)
    else
      comment_comments_path(commentable)
    end
  end
end
