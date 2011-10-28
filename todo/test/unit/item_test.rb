require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "attributes must not be empty" do
		item = Item.new
		assert item.invalid?
		assert item.errors[:name].any?
		assert item.errors[:description].any? == false
		assert item.errors[:due_date].any?
		assert item.errors[:list_id].any?
		assert true
  end
end
