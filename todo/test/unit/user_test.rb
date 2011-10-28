require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "username, password and email should be nonempty" do
		user = User.new
		assert user.invalid?
		assert user.errors[:username].any?
		assert user.errors[:password].any?
		assert user.errors[:email].any?
  end
  
  test "password length check" do
    user = User.new
    user.password < 6
    assert user.invalid? 
    assert_equal "Must be 6 or more characters",
      user.error[:password].join('; ')
    
    user.password >= 6
    assert user.valid?
  end
end
