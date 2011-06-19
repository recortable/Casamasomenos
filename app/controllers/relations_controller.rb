# encoding: utf-8

class RelationsController < ApplicationController
  respond_to :html
  expose(:article) { params[:article_id].present? ? Article.find(params[:article_id]) : nil }
  expose(:relations) { article ? article.relations : Relation.all }
  expose(:relation)


  def index
  end

  def show
  end

  def new
  end

  def create
    authorize! :create, relation
    relation.user = current_user
    relation.normalize_category!
    flash[:notice] = 'Artículos relacionados.' if relation.save
    respond_with relation, :location => relation.from
  end

  def destroy
    authorize! :destroy, relation
    flash[:notice] = 'Relación entre artículos eliminada' if relation.destroy
    respond_with relation, :location => relation.from
  end

end
