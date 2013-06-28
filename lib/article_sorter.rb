class ArticleSorter
  attr_reader :params
  
  def initialize(params)
    @params = params
  end
  
  def results
    send("sort_by_#{sort_attribute}")
  end
  
  private

  def sort_attribute
    params[:sort].presence || "newest"
  end

  def sort_by_newest
    default_scope.by_created_at
  end

  def sort_by_rating
    params[:year] ? rating_scope.for_date_range(time_range) : rating_scope
  end

  def default_scope
    Article
  end

  def rating_scope
    default_scope.by_rating
  end

  def time_range
    time_from_params.send("all_#{time_detail_level}")
  end

  def time_from_params
    Time.new(params[:year], params[:month], params[:day]).in_time_zone
  end

  def time_detail_level
    [:day, :month, :year].detect { |detail_level| params[detail_level] }
  end
end
