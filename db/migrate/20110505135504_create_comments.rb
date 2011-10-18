class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.belongs_to :author
      t.belongs_to :zap, :polymorphic => true
      t.string :ancestry
      t.timestamps
    end
    add_index :comments, :author_id
    add_index :comments, :ancestry
    add_index :comments, :resource_id
    add_index :comments, :resource_type
  end
end
