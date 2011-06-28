class CategoriesController < ApplicationController
  respond_to :html
  expose(:category) { Category.find(params[:id])}

  def show

  end
end
