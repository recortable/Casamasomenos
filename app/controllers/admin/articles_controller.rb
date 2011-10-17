class Admin::ArticlesController < Admin::ResourceController
  resource :article
  expose(:articles) { Article.ordered }
  expose(:article)

  def show

  end
end