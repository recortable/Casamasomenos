class Admin::ArticlesController < Admin::ZapController
  resource :article
  expose(:articles) { Article.order("#{list_order} #{order_type}") }
  expose(:article)
  expose(:list_order) do
    ['title', 'updated_at'].include?(params[:order]) ? params[:order] : 'title'
  end
  expose(:order_type) do
    list_order == 'title' ? 'ASC' : 'DESC'
  end

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