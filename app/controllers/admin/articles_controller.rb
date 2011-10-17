class Admin::ArticlesController < Admin::ResourceController
  resource :article
  expose(:articles) { Article.ordered }
  expose(:article)

  def sort
    params[:article].each_with_index do |id, index|
      Article.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end

end