class Article < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  has_many :comments, :as => :resource
  has_ancestry :cache_depth => true

  validates :title, :presence => true
  validates :author_id, :presence => true

end
