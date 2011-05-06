class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string      :name,            :limit => 300
      t.text        :body
      t.belongs_to  :author
      t.string      :ancestry
      t.integer     :ancestry_depth,  :default => 0
      t.timestamps
    end
    add_index :articles, :ancestry
    add_index :articles, :author_id
  end
end
