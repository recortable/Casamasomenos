# Relation
#
#  t.integer  "from_id"
#  t.integer  "to_id"
#  t.integer  "user_id"
#  t.string   "category",         :limit => 16
#  t.datetime "created_at"
#  t.datetime "updated_at"
#  t.integer  "from_category_id"
#  t.integer  "to_category_id"
#

class Relation < ActiveRecord::Base
  belongs_to :from, :class_name => 'Article'
  belongs_to :to, :class_name => 'Article'
  belongs_to :from_category, class_name: 'Category'
  belongs_to :to_category, class_name: 'Category'
  belongs_to :user
  attr_accessor :user_category
  attr_accessor :other

  CATEGORIES = ['parent', 'experiencie']
  USER_CATEGORIES = ['parent', 'inverse_parent', 'experiencie', 'inverse_experiencie']

  scope :aggregations, where(:category => 'parent')
  scope :experiencies, where(:category => 'experiencie')


  #scope :from_category, lambda { |category| (joins(:from).merge(Article.by_category(category))) }
  #scope :to_category, lambda { |category| (joins(:to).merge(Article.by_category(category))) }
  scope :of_article, lambda { |article_id| where(['from_id = ? OR to_id = ?', article_id, article_id]) }

  validates :from_id, :presence => true
  validates :to_id, :presence => true
  validates :user_id, :presence => true
#  validates :category, :presence => true
  validates :from_category_id, :presence => true
  validates :to_category_id, :presence => true
  #validates :user_category, :presence => true

  def reverse
    Relation.new(:from => self.to, :to=> self.from, :user => self.user)
  end

  # related_to
  # find the article related to the given article
  def related_to(article)
    article_id = article.id
    if to_id == article_id
      from
    elsif from_id == article_id
      to
    else
      nil
    end
  end


  def normalize_category!
    if user_category =~ /^inverse_/
      self.category = user_category[8..-1]
      from = self.from
      self.from = self.to
      self.to = from
    else
      self.category = user_category
    end
  end

end
