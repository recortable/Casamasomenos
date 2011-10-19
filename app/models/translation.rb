class Translation < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  belongs_to :article

  LANGS = [:es, :en]

  validates :author_id, presence: true
  validates :article_id, presence: true
end
