class PagesController < ApplicationController
  layout 'pages'

  expose(:article) { Article.find(1) }

  def index
    age = 24 * 60 * 60 # 24 horas
    response.headers['Cache-Control'] = "public, max-age=#{age}"
  end
end
