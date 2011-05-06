class Article < ActiveRecord::Base
  belongs_to :parent, :class_name => 'Article'
  belongs_to :author, :class_name => 'User'
  has_many :comments, :as => :resource
  has_ancestry

  validates :name, :presence => true
  validates :body, :presence => true
  validates :author_id, :presence => true

end
