module ArticlesHelper
  def nested_articles(articles)
    articles.map do |article, sub_articles|
      render(article) + content_tag(:div, nested_articles(sub_articles), :class => "nested_articles")
    end.join.html_safe
  end
end
