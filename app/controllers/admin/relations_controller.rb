class Admin::RelationsController < Admin::ZapController
  resource :relation
  expose(:article) { params[:article_id].present? ? Article.find(params[:article_id]) : nil }
  expose(:parent) { article ? article : Site }
  expose(:relations) { parent.relations }
  expose(:relation)

  # new
  expose(:articles) { Article.order('title ASC') }
  expose(:categories) { Category.all }

  def new
    if article
      relation.from = article
    else
      redirect_to admin_articles_path
    end
  end

  def create
    relation.user = current_user
    relation.from_category = relation.from.category if relation.from.present?
    relation.to_category = relation.to.category if relation.to.present?
    create! [:admin, relation.from]
  end

  def destroy
    destroy! [:admin, article]
  end
end
