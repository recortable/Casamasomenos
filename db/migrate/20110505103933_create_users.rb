class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :limit => 100
      t.string :email, :limit => 300
      t.string :rol, :limit => 16
      t.timestamps
    end

    User.create(:name => 'Admin', :email => 'super@casamasomenos.net', :rol => 'admin')
    User.create(:name => 'Anonymous', :email => 'anonymous@casamasomenos.net', :rol => 'anonymous')
    User.create(:name => 'Danigb', :email => 'danigb@gmail.com', :rol => 'admin')
  end
end
