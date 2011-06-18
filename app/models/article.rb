class Article < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  has_many :comments, :as => :resource
  has_many :mediafiles, :as => :resource
  has_ancestry :cache_depth => true

  scope :models, where(:category => 'model')
  scope :experiencies, where(:category => 'experience')
  scope :pages, where(:category => 'page')

  scope :by_modification, order('updated_at DESC')

  validates :title, :presence => true
  validates :author_id, :presence => true

end
