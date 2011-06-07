class Mediafile < ActiveRecord::Base
  belongs_to :user
  belongs_to :resource, :polymorphic => true

  mount_uploader :file, FileUploader

  validates :user_id, :presence => true
end
