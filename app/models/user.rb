class User < ActiveRecord::Base
  validates :name, :presence => true
  validates :email, :presence => true

  def admin?
    rol == 'admin'
  end

  def anonymous?
    rol == 'anonymous'
  end

end
