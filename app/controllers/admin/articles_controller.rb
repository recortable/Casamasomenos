class Admin::ArticlesController < Admin::ZapController
  resource :article
  expose(:articles) { Article.order('title ASC') }
  expose(:article)

  def index
  end

  def new
    article.parent = Article.find(params[:parent]) if params[:parent].present?
    respond_with article
  end

  def create
    # TODO: article states
    article.state = 'published'
    create! [:admin, article]
  end

  def destroy
    destroy! [:admin, article.parent]
  end

  def sort
    params[:article].each_with_index do |id, index|
      Article.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end

end