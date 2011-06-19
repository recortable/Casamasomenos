class Relation < ActiveRecord::Base
  belongs_to :from, :class_name => 'Article'
  belongs_to :to, :class_name => 'Article'
  belongs_to :user

  CATEGORIES = ['parent']

  validates :from_id, :presence => true
  validates :to_id, :presence => true
  validates :user_id, :presence => true
  validates :category, :presence => true
end
