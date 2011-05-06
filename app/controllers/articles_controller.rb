#encoding: utf-8

class ArticlesController < ApplicationController
  expose(:root) { Article.first }
  expose(:article)
  expose(:parent) { Article.find params[:parent_id] }
  expose(:comment) { Comment.new(:resource => article) }

  def index
  end

  def new
    article.parent = parent
    article.author = current_user
    authorize! :new, article
  end

  def show
    authorize! :show, article
  end

  def edit
    authorize! :edit, article
  end


  def create
    params[:article][:author_id] = current_user.id
    logger.debug(article.to_json)
    authorize! :create, article
    flash[:notice] = 'Artículo añadido.' if article.save
    redirect_to article
  end

  def update
    flash[:notice] = 'Artículo actualizado.' if article.update_attributes(params[:article])
    redirect_to article
  end

end
