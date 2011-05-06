require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user should have roles" do
    user = User.new(:name => 'user', :email => 'user@domain.com')
    assert user.save
    assert !user.admin?
    assert !user.anonymous?
  end
end
