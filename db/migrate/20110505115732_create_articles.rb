class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name, :limit => 300
      t.text :body
      t.belongs_to :author
      t.string :ancestry

      t.timestamps
    end
    add_index :articles, :ancestry
    add_index :articles, :author_id

    Article.create(:name => 'Casa + o -', :author_id => 1)
  end
end
