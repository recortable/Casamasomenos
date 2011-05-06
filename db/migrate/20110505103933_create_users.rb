class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :limit => 100
      t.string :email, :limit => 300
      t.string :rol, :limit => 16
      t.timestamps
    end

  end
end
