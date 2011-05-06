class Article < ActiveRecord::Base
  has_ancestry :cache_depth => true
  belongs_to :author, :class_name => 'User'
  has_many :comments, :as => :resource

  validates :name, :presence => true
  validates :body, :presence => true
  validates :author_id, :presence => true

end
