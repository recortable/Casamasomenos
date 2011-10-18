class Admin::CategoriesController < Admin::ZapController
  resource :category
  expose(:categories) { Category.all }
  expose(:category)
end

