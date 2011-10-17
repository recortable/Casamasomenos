module Admin::ApplicationHelper

  def nav_link_to(name, url)
    active = current_page?(url)
    content_tag(:li, link_to(name, url), class: "#{'active' if active}")
  end
end
