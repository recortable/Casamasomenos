module ArticlesHelper
  def nested_articles(articles)
    articles.map do |article, sub_articles|
      render(:partial => 'nested', :locals => {:article => article}) +
          content_tag(:div, nested_articles(sub_articles), :class => "nested_articles")
    end.join.html_safe
  end

  def singular_category(category)
    I18n.t("article.categories.singular.#{category}")
  end
end
