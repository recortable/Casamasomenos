module ArticlesHelper

  def article_tree_for(article)
    articles = article.descendants.where(state: :published).arrange(order: 'position ASC')
    content_tag :div, article_tree(articles)
  end

  def article_tree(articles, depth = 0)
    if articles.size > 0
      content_tag(:ul, class: "depth-#{depth}") do
        articles.map do |article, children|
          content_tag(:li, span_or_link_to(article.title, article),
                      class: "article-#{article.id} depth-#{article.ancestry_depth} link_to-#{article.id} #{'visible' if article.always_visible_on_tree}") +
              article_tree(children, depth + 1)
        end.join.html_safe
      end
    end
  end


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
