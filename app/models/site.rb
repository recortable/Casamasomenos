class Site
  def self.relations
    Relation.scoped
  end

  def self.mediafiles
    Mediafile.scoped
  end

  def self.tree
    Article.where(state: 'published').arrange(order: 'position ASC')
  end
end

