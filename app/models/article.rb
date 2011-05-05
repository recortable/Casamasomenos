class Article < ActiveRecord::Base
  belongs_to :parent, :class_name => 'Article'
  belongs_to :author, :class_name => 'User'
  has_many :comments, :as => :resource

  validates :name, :presence => true
  validates :author_id, :presence => true
  has_ancestry

end
