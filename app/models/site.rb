class Site

  
  def tree(only_published = true)
    articles = Article.scoped
    articles.where(state: 'published') if only_published
    articles.arrange(order: 'position ASC')
  end
  
  def comments
    @comments ||= Comment.scoped
  end

  def mediafiles
    @mediafiles ||= Mediafile.scoped
  end

  def relations
    @relations ||= Relation.scoped
  end
  
  def about
    @about ||= Article.find 1
  end

  def strategies
    @strategies ||= Article.find(136)
  end

  def experiencies
    @experiencies ||= Article.find(57)
  end

  def process
    @process ||= Article.find(135)
  end
end

