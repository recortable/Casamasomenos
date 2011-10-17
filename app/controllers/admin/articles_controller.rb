class Admin::ArticlesController < Admin::ResourceController
  resource :article
  expose(:articles) { Article.all }
  expose(:article)

  def index

  end
end