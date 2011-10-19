# Category
#    t.string   "name",       :limit => 32
#    t.string   "es_name",    :limit => 64
#    t.string   "en_name",    :limit => 64
#    t.datetime "created_at"
#    t.datetime "updated_at"
#
class Category < ActiveRecord::Base
  has_many :articles

  validates :name, presence: true
  validates :es_name, presence: true
  validates :en_name, presence: true

  CATEGORIES = ['page', 'area', 'concept', 'strategy', 'typological', 'management', 'participatory', 'experience']
end