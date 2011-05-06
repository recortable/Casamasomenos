#encoding: utf-8

class ArticlesController < ApplicationController
  respond_to :html
  respond_to :js, :only => :show
  expose(:root) { Article.first }
  expose(:article)
  expose(:parent) {  Article.find(params[:article] ? params[:article][:parent_id] : params[:parent_id]) }
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
    article.author = current_user
    authorize! :create, article
    flash[:notice] = article.save ? 'Articulo añadido.' : "El artículo contiene #{article.errors.size} errores"
    respond_with article
  end

  def update
    flash[:notice] = 'Artículo actualizado.' if article.update_attributes(params[:article])
    respond_with article
  end

end
