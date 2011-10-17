class Navigation
  def tree
    @tree ||= Article.arrange(order: 'position ASC')
  end
end

