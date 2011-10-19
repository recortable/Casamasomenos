# Article
#
#  t.string   "title",          :limit => 300
#  t.text     "body"
#  t.string   "lang",           :limit => 6
#  t.integer  "author_id"
#  t.datetime "created_at"
#  t.datetime "updated_at"
#  t.integer  "category_id"
#  t.string   "ancestry",       :limit => 300
#  t.integer  "ancestry_depth",                :default => 0
#  t.integer  "position"
#  t.string   "state",          :limit => 16
#
class Article < ActiveRecord::Base
  has_ancestry cache_depth: true
  acts_as_list scope: 'ancestry = \'#{ancestry}\''
  scope :ordered, order: "ancestry_depth,position ASC"


  belongs_to :author, :class_name => 'User'
  belongs_to :category
  has_many :comments, :as => :resource, :order => 'id DESC'
  has_many :mediafiles, :as => :resource
  has_many :translations

  has_many :relations, :class_name => 'Relation', :foreign_key => 'from_id', :dependent => :destroy
  has_many :inverse_relations, :class_name => 'Relation', :foreign_key => 'to_id', :dependent => :destroy

  scope :by_modification, order('updated_at DESC')

  validates :title, :presence => true
  validates :author_id, :presence => true
  validates :category_id, :presence => true
  validates :state, presence: true

  STATES = [:published, :draft, :hidden]


  def all_relations
    @all ||= Relation.of_article(self)
  end

  def grouped_relations
    @grouped ||= all_relations.map do |relation|
      other_id = relation.from_id == self.id ? relation.to_id : relation.from_id
      relation.other = Article.find other_id
      relation
    end.group_by {|r| r.other.category }
  end


  def to_param
    "#{id}-#{title.parameterize}"
  end

end
