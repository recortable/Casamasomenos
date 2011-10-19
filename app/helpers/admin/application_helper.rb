module Admin::ApplicationHelper

  def nav_link_to(name, url)
    active = current_page?(url)
    content_tag(:li, link_to(name, url), class: "#{'active' if active}")
  end

  def admin_nested_articles(articles)
    content_tag :ul do
      articles.map do |article, children|
        content_tag :li do
          link_to(article.title, [:admin, article]) +
              admin_nested_articles(children)
        end
      end.join.html_safe
    end
  end

  ICONS = {view: '&#9758;', new: '+', edit: '&#9998;',
           delete: '&#10008;', delete_alt: '&#9986;'}
  def icon(name, label = '')
    raw("#{ICONS[name]} #{label}")
  end
end
