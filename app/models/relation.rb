class Relation < ActiveRecord::Base
  belongs_to :from, :class_name => 'Article'
  belongs_to :to, :class_name => 'Article'
  belongs_to :user
  attr_accessor :user_category

  CATEGORIES = ['parent', 'experiencie']
  USER_CATEGORIES = ['parent', 'inverse_parent', 'experiencie', 'inverse_experiencie']

  scope :aggregations, where(:category => 'parent')
  scope :experiencies, where(:category => 'experiencie')


  validates :from_id, :presence => true
  validates :to_id, :presence => true
  validates :user_id, :presence => true
  validates :category, :presence => true

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
