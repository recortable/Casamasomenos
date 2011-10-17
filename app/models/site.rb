class Site
  def self.relations
    Relation.scoped
  end

  def self.mediafiles
    Mediafile.scoped
  end
end

