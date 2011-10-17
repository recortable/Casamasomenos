class Navigation
  def tree
    @tree ||= Article.arrange(order: 'position')
  end
end

