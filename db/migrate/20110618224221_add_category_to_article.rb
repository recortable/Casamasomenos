class AddCategoryToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :category, :string, :limit => 32

    presentacion = Article.find 2
    experiencia = Article.find 57

    ActiveRecord::Base.record_timestamps = false
    Article.all.each do |article|
      if article.title == 'Eliminar'
        article.destroy
      else
        value = 'model'
        value = 'experience' if article.parent == experiencia
        value = 'page' if article.parent == presentacion
        article.update_attribute(:category, value)
      end
    end
  end
end
