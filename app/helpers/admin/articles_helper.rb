module Admin::ArticlesHelper
  def pill_link_if(active, title, url)
    link = active ? '#' : url
    active_class = active ? 'active' : ''
    content_tag(:li, link_to(title, link), class: active_class)
  end
end