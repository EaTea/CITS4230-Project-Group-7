require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "username, password and email should be nonempty" do
		user = User.new
		assert user.invalid?
		assert user.errors[:username].any?
		assert user.errors[:password].any?
		assert user.errors[:email].any?
  end
end
