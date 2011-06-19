class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.belongs_to :from
      t.belongs_to :to
      t.belongs_to :user
      t.string :category, :limit => 16
      t.timestamps
    end
    add_index :relations, :from_id
    add_index :relations, :to_id
    add_index :relations, :user_id

    Article.all.each do |article|
      if article.parent
        Relation.create(:from => article.parent, :to => article, :category => 'parent', :user_id => 1)
      end
    end

    remove_column :articles, :ancestry
  end
end
