module ApplicationHelper
  def title(text)
    content_for(:title) { text }
    content_tag(:h1, text)
  end

  def render_body(model)
    content_tag(:div, RDiscount.new(model.body, :smart, :filter_html).to_html.html_safe, :class => 'body')
  end
end
