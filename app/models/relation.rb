class Relation < ActiveRecord::Base
  belongs_to :from, :class_name => 'Article'
  belongs_to :to, :class_name => 'Article'
  belongs_to :user
  attr_accessor :user_category

  CATEGORIES = ['parent', 'experiencie']
  USER_CATEGORIES = ['parent', 'inverse_parent', 'experiencie', 'inverse_experiencie']

  scope :aggregations, where(:category => 'parent')
  scope :experiencies, where(:category => 'experiencie')


  scope :from_category, lambda {|category| (joins(:from).merge(Article.by_category(category))) }
  scope :to_category, lambda {|category| (joins(:to).merge(Article.by_category(category))) }
  scope :of_article, lambda {|article_id| where(['from_id = ? OR to_id = ?', article_id, article_id]) }

  validates :from_id, :presence => true
  validates :to_id, :presence => true
  validates :user_id, :presence => true
  validates :category, :presence => true
  validates :user_category, :presence => true

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
