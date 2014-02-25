require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should return name" do
    user = users(:one)
    assert_equal("#{user.first_name} #{user.last_name}", user.name)
  end
end
