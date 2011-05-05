class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name, :limit => 300
      t.text :content
      t.belongs_to :parent

      t.timestamps
    end
    add_index :articles, :parent_id
  end
end
