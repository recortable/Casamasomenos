class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, :limit => 32
      t.string :es_name, :limit => 64
      t.string :en_name, :limit => 64
      t.timestamps
    end

    Category::CATEGORIES.each do |name|
      Category.create(:name => name, :es_name => name, :en_name => name)
    end

    add_column :articles, :category_id, :integer

    Article.all.each do |article|
      category = Category.find_by_name(article.category)
      article.update_attribute(:category_id, category.id) if category
    end

    remove_column :articles, :category

  end
end
