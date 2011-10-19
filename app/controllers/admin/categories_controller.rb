class Admin::CategoriesController < Admin::ZapController
  resource :category
  expose(:categories) { Category.all }
  expose(:category)


  def index

  end

  def new

  end

  def update
    update! { [:admin, :categories] }
  end
end

