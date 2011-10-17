class AddAncestryToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :ancestry, :string, :limit => 300
    add_column :articles, :ancestry_depth, :integer, :default => 0
    add_column :articles, :position, :integer
    add_index :articles, :ancestry

    Relation.where(category: 'parent').all.each do |relation|
      relation.to.parent = relation.from
      relation.to.save
      relation.destroy
    end
  end
end
