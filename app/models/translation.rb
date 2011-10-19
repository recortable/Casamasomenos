#
#    t.integer  "author_id"
#    t.integer  "article_id"
#    t.string   "title",      :limit => 300
#    t.text     "body"
#    t.string   "lang",       :limit => 8
#    t.datetime "created_at"
#    t.datetime "updated_at"
#
class Translation < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  belongs_to :article

  LANGS = [:es, :en]

  validates :author_id, presence: true
  validates :article_id, presence: true
  validates :lang, presence: true
  validates :title, presence: true


end
