class AddContentTypeToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :content_type, :string, limit: 16

    ActiveRecord::Base.record_timestamps = false
    Article.all.each do |article|
      article.state = 'draft' if article.body.blank?
      article.content_type = 'text/markdown'
      article.save
    end
  end
end
