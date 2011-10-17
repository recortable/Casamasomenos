class AddStateToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :state, :string, :limit => 16
    Article.update_all state: 'published'
  end
end
