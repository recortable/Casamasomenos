class Article < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  has_many :comments, :as => :resource
  has_many :mediafiles, :as => :resource

  has_many :parent_relations, :class_name => 'Relation', :foreign_key => 'to_id',
           :conditions => {:category => 'parent'}
  has_many :parents, :through => :parent_relations, :source => :from
  has_many :child_relations, :class_name => 'Relation', :foreign_key => 'from_id',
           :conditions => {:category => 'parent'}
  has_many :children, :through => :child_relations, :source => :to

  scope :models, where(:category => 'model')
  scope :experiencies, where(:category => 'experience')
  scope :pages, where(:category => 'page')

  scope :by_modification, order('updated_at DESC')

  validates :title, :presence => true
  validates :author_id, :presence => true

end
