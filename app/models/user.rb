class User < ActiveRecord::Base
  include Models::User::RolMethods

  validates :name, :presence => true
  validates :email, :presence => true

  has_roles :admin, :anonymous
end
