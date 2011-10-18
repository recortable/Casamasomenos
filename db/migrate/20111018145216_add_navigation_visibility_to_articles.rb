class AddNavigationVisibilityToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :always_visible_on_tree, :boolean, default: false

    Article.where(id: [1, 126, 121, 9, 11, 125, 37, 122, 124, 98, 127, 128, 57]).
        update_all(always_visible_on_tree: true)

  end
end
