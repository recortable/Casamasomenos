# Article
#
#  t.string   "title",      :limit => 300
#  t.text     "body"
#  t.string   "lang",       :limit => 6
#  t.integer  "author_id"
#  t.datetime "created_at"
#  t.datetime "updated_at"
#  t.string   "category",   :limit => 32
#
class Article < ActiveRecord::Base
  has_ancestry cache_depth: true
  acts_as_list scope: 'ancestry = \'#{ancestry}\''
  scope :ordered, order: "ancestry_depth,position DESC"


  belongs_to :author, :class_name => 'User'
  belongs_to :category
  has_many :comments, :as => :resource, :order => 'id DESC'
  has_many :mediafiles, :as => :resource


  has_many :relations, :class_name => 'Relation', :foreign_key => 'from_id', :dependent => :destroy
  has_many :inverse_relations, :class_name => 'Relation', :foreign_key => 'to_id', :dependent => :destroy

  has_many :parent_relations, :class_name => 'Relation', :foreign_key => 'to_id',
           :conditions => {:category => 'parent'}
  has_many :parents, :through => :parent_relations, :source => :from

  has_many :child_relations, :class_name => 'Relation', :foreign_key => 'from_id',
           :conditions => {:category => 'parent'}
  has_many :children, :through => :child_relations, :source => :to

  scope :by_category, lambda { |category| where(:category => category) }

  scope :models, where(:category => 'model')
  scope :experiences, where(:category => 'experience')
  scope :pages, where(:category => 'page')

  scope :by_modification, order('updated_at DESC')

  validates :title, :presence => true
  validates :author_id, :presence => true
  validates :category_id, :presence => true
  validates :state, presence: true

  STATES = [:published, :draft, :hidden]


  def all_relations
    Relation.of_article(self)
  end

  def grouped_relations
    if @relations.blank?
      @relations = {}
      Category::CATEGORIES.each { |category| @relations[category] = [] }
      all_relations.each do |relation|
        relation = relation.reverse if relation.to_id == self.id
        @relations[relation.to.category] << relation
      end
    end
    @relations
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end

end
