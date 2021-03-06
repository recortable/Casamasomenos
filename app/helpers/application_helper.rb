#encoding: utf-8
module ApplicationHelper
  def title(text, options = {})
    tag = options[:tag] || :h1
    content_for(:title) { text }
    text = raw("#{text}<small>&nbsp;#{options[:small]}</small>") if options[:small].present?
    content_tag(tag, text, :class => 'title')
  end

  # translate collection
  def tc(prefix, collection)
    collection.map { |i| [I18n.t("#{prefix}.#{i}"), i] }
  end

  def span_or_link_to(name, options = {}, html_options = {}, &block)
    current_page?(options) ? content_tag(:span, name, html_options) : link_to(name, options, html_options, &block)
  end




  def render_body(model)
    text = model.body.present? ? model.body : '*aún no tiene contenido*'
    text.gsub!(/^#/, '##')
    text = RDiscount.new(text, :smart, :filter_html).to_html
    text = replace_right_images(text)
    text = replace_right_text(text)
    text = replace_center_images(text)
    content_tag(:div, text.html_safe, :class => 'body')
  end

  protected
  def replace_center_images(text)
    text.gsub /!@(\d+)/ do
      image = Mediafile.find_by_id($1)
      if image
        content_tag(:div, render_mediafile(image), class: 'mediafile')
      else
        "<div class='notice'>Imágen no encontrada</div>"
      end
    end
  end

  def replace_right_images(text)
    text.gsub /!!@(\d+)/ do
      image = Mediafile.find_by_id($1)
      if image
        content_tag(:div, render_mediafile(image), :class => 'mediafile right')
      else
        "<div class='notice'>Imágen no encontrada</div>"
      end
    end
  end

  def replace_right_text(text)
    text.gsub /!!#(.*)/ do
      content_tag(:div, $1, :class => 'mediafile right')
    end
  end


end
