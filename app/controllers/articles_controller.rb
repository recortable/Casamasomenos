#encoding: utf-8

class ArticlesController < ApplicationController
  respond_to :html
  respond_to :js, :only => :show
  expose(:articles) { Article.all }
  expose(:article)
  expose(:comment) { Comment.new(:resource => article) }


  expose(:models) { Article.models.by_modification }
  expose(:experiencies) { Article.experiencies }
  expose(:pages) { Article.pages }
  def index
  end

  def new
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
    article.author = current_user
    authorize! :create, article
    flash[:notice] = article.save ? 'Articulo añadido.' : "El artículo contiene #{article.errors.size} errores"
    respond_with article
  end

  def update
    flash[:notice] = 'Artículo actualizado.' if article.update_attributes(params[:article])
    respond_with article
  end

  def destroy
    flash[:notice] = 'Hemos borrado el artículo' if article.destroy
    respond_with article, :location => root_path
  end
end
