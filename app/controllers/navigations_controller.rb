class NavigationsController < ApplicationController
  layout 'navigation'
  expose(:article)

  def index
    redirect_to navigation_path(Article.first)
  end

  def show

  end
end
