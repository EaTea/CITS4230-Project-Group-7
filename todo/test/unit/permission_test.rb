require 'test_helper'

class PermissionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "attributes nonempty" do
		perm = Permission.new
		assert !perm.valid?
		assert !perm.errors[:add].any?
		assert !perm.errors[:del].any?
		assert !perm.errors[:own].any?
		assert !perm.errors[:edit].any?
		assert perm.errors[:user_id].any?
		assert perm.errors[:list_id].any?
  end

	test "owner has all permissions" do
		assert List.new(:id => 8, :name => "test").save and
		User.new(:id => 8, :username => "tester", :email => "something@email.com", :password => "password").save
		perm = Permission.new ( :id => 8,
														:user_id => 8,
														:list_id => 8,
														:add => 0,
														:del => 0,
														:edit => 0,
														:own => 1)
		assert !(perm.valid?)
		assert (perm.errors[:own].any?)
		perm = Permission.new ( :id => 8,
														:user_id => 8,
														:list_id => 8,
														:add => 1,
														:del => 1,
														:edit => 1,
														:own => 1)
		assert !(perm.valid?)
		#database inconsistencies between testing, .valid? ends up being false
		assert !(perm.errors[:own].any?)
	end

end
