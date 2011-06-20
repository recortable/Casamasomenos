class User < ActiveRecord::Base
  include Models::User::RolMethods
  attr_accessible :name, :email,:rol, :password, :password_confirmation

  has_secure_password

  validates :name, :presence => true
  validates :email, :presence => true
  #validates :password, :presence => true, :on => :create

  has_roles :admin, :anonymous
end
