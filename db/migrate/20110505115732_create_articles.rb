class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string      :title,            :limit => 300
      t.text        :body
      t.string      :lang, :limit => 6
      t.belongs_to  :author
      t.string :ancestry
      t.timestamps
    end
    add_index :articles, :author_id
    add_index :articles, :ancestry
  end
end
