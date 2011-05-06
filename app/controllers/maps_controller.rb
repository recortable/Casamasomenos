class MapsController < ApplicationController
  expose(:article) {Article.first}
  expose(:comment) { Comment.new(:resource => article) }

  def show

  end
end
