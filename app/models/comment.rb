class Comment < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  belongs_to :resource, :polymorphic => true
  has_ancestry

  validates :author_id, :presence => true
  validates :body, :presence => true
end
