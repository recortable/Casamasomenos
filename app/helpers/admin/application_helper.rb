module Admin::ApplicationHelper

  def nav_link_to(name, url)
    active = current_page?(url)
    content_tag(:li, link_to(name, url), class: "#{'active' if active}")
  end

  def admin_nested_articles(articles)
    content_tag :ul do
      articles.map do |article, children|
        content_tag :li do
          postfix = article.always_visible_on_tree ? "&lArr;&nbsp;" : ''
          postfix += link_to('[editar]', [:edit, :admin, article])
          postfix = raw(postfix)
          link_to(article.title, [:admin, article], class: "article #{article.state}") +
              postfix + admin_nested_articles(children)
        end
      end.join.html_safe
    end
  end

  ICONS = {view: '&#9758;', new: '+', edit: '&#9998;',
           delete: '&#10008;', delete_alt: '&#9986;',
           back: '&larr;'}

  def icon(name, label = '')
    raw("#{ICONS[name]} #{label}")
  end
end
