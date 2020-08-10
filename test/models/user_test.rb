require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "create users with different roles" do
    user = User.create(role: 1)
    assert_equal "salesman", user.role
    user = User.create(role: "admin")
    assert_equal "admin", user.role
    user = User.create(role: 2)
    assert user.client?
  end
end
