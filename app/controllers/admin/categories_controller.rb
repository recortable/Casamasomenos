class Admin::CategoriesController < Admin::ResourceController
  resource :category
  expose(:categories) { Category.all }
end

