class CreateMediafiles < ActiveRecord::Migration
  def change
    create_table :mediafiles do |t|
      t.belongs_to :user
      t.belongs_to :zap, :polymorphic => true

      t.string :title, :limit => 300
      t.string :description, :limit => 512
      t.string :file, :limit => 300
      t.string :code, :limit => 1024
      t.string :media_type, :limit => 16
      t.timestamps
    end

    add_index :mediafiles, :user_id
    add_index :mediafiles, :resource_id
    add_index :mediafiles, :resource_type
  end
end
