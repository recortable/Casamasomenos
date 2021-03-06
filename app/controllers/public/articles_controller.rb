#encoding: utf-8

class Public::ArticlesController < ApplicationController
  respond_to :html

  expose(:site) { Site.new }
  expose(:articles) { Article.all }
  expose(:article)
  expose(:comment) { Comment.new(:resource => article) }

  def index
    params[:id] = 1
    render 'show'
  end

  def show
    authorize! :show, article
  end
end
