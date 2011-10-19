class Session
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :email, :password
  attr_reader :user
  validates :name, presence: true
  validates :email, presence: true

  def initialize(attributes = {})
    if attributes
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
  end

  def save
    user = User.find_by_email(@email)
    if user && user.authenticate(@password)
      @user = user
      true
    else
      false
    end
  end


  def persisted?
    false
  end
end

