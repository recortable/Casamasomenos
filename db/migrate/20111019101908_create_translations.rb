class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.belongs_to :author
      t.belongs_to :article
      t.string :title, limit: 300
      t.text :body
      t.string :lang, limit: 8
      t.timestamps
    end

    add_column :articles, :languages, :string, :limit => 30

    Article.update_all(lang: 'es')
  end
end
