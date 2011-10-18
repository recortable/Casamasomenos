class Site
  def self.relations
    Relation.scoped
  end

  def self.mediafiles
    Mediafile.scoped
  end

  def self.tree
    Article.arrange(order: 'position ASC')
  end
end

