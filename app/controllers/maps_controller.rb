class MapsController < ApplicationController
  expose(:article) {Article.first}
  expose(:comment) { Comment.new(:resource => article) }

  def show
    max-age = 2 * 60 * 60
    response.headers['Cache-Control'] = "public, max-age=#{max-age}"
  end
end
