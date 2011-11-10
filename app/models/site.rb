class Site
  def self.relations
    @@relations ||= Relation.scoped
  end

  def self.mediafiles
    Mediafile.scoped
  end

  def self.tree
    Article.where(state: 'published').arrange(order: 'position ASC')
  end

  def self.about
    @@about ||= Article.find 1
  end

  def self.strategies
    @@strategies ||= Article.find(136)
  end

  def self.experiencies
    @@experiencies ||= Article.find(57)
  end

  def self.process
    @@process ||= Article.find(135)
  end
end

