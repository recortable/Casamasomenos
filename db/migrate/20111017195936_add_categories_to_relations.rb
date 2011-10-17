class AddCategoriesToRelations < ActiveRecord::Migration
  def change
    add_column :relations, :from_category_id, :integer
    add_column :relations, :to_category_id, :integer

    Relation.all.each do |relation|
      relation.from_category_id = relation.from.category_id
      relation.to_category_id = relation.to.category_id
      relation.save!
    end
  end
end
