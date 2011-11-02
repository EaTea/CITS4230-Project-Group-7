require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "username, password and email should be nonempty" do
		user = User.new
		assert user.invalid?
		assert user.errors[:username].any?
		assert user.errors[:password].any?
		assert user.errors[:email].any?
  end
  
  test "passwords" do
    #user = User.new
    #assert !user.password.empty?
    #assert user.password.length > 5
    #assert_match /(0-9)/, user.password
    #assert_not_equal 'password', user.password.downcase   
  end
end
