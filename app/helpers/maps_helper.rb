module MapsHelper

  def data_map_script(articles)
    output = []
    append_data(articles, output)
    data = "\nvar datamap_data = #{output.first.to_json};\n".html_safe
    content_tag(:script, data)
  end

  protected
  def append_data(articles, array)
    articles.map do |article, sub_articles|
      data = {:id => article.id, :name => article.name.gsub(/\s+/,'&nbsp;'), :children => []}
      append_data(sub_articles, data[:children])
      array << data
    end
  end
end
