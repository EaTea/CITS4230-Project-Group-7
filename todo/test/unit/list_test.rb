require 'test_helper'

class ListTest < ActiveSupport::TestCase
	test "name is nonempty" do
		list = List.new
		assert list.invalid?
		assert list.errors[:name].any?
	end

	test "list association to items is correct" do
		list = List.new(name: "Groceries")
	end
end
