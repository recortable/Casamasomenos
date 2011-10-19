#
#    t.integer  "user_id"
#    t.integer  "resource_id"
#    t.string   "resource_type"
#    t.string   "title",         :limit => 300
#    t.string   "description",   :limit => 512
#    t.string   "file",          :limit => 300
#    t.string   "code",          :limit => 1024
#    t.string   "media_type",    :limit => 16
#    t.datetime "created_at"
#    t.datetime "updated_at"
#
class Mediafile < ActiveRecord::Base
  belongs_to :user
  belongs_to :resource, :polymorphic => true

  mount_uploader :file, FileUploader

  validates :user_id, :presence => true
end
