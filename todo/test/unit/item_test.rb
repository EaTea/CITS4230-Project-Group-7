require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "attributes must not be empty" do
		item = Item.new
		assert item.invalid?
		assert item.errors[:name].any?
		assert item.errors[:description].any? == false #description could be blank
		assert item.errors[:due_date].any?
		assert item.errors[:list_id].any?
		assert true
  end
  
  test "items of todo list" do
    #create a new List object using the name field from first record in the text fixtures/lists.yml 
    todo_list_items1 = Item.new (:name => items(:one).name,
                                :description => items(:one).description,
                                :due_date => items(:one).due_date,
                                :list_id => items(:one).list_id,
																:id => 10)

		#assert that a nonexistent list will cause a failure
    assert !todo_list_items1.valid?
		
		List.new(:name => "temp", :id => items(:one).list_id).save

		#assert that an item with a due date in the past cannot be considered valid (must always go forward)
    assert !todo_list_items1.valid?
		assert todo_list_items1.errors[:due_date].any?

		todo_list_items1.due_date = Date.today + 10

    assert todo_list_items1.valid?

		assert todo_list_items1.save

		name_too_long = Item.new(		:name => items(:one).name + "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                                :description => items(:one).description,
                                :due_date => Date.today + 10,
                                :list_id => items(:one).list_id,
																:id => 10)

    assert !name_too_long.valid?
    assert name_too_long.errors[:name].any?

		description_too_long = Item.new(		:name => items(:one).name,
                               					:description => items(:one).description + "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                                				:due_date => Date.today + 10,
                                				:list_id => items(:one).list_id,
																				:id => 10)

    assert !description_too_long.valid?
    assert description_too_long.errors[:description].any?

    todo_list_items1_copy = Item.find(todo_list_items1.id)

    #test the success of retrieval: Test the ability to read DB record
    assert_equal todo_list_items1.name, todo_list_items1_copy.name

    #Assigning new name for todo_list1 object
    todo_list_items1.name = "Another Sample of Buying Cooking Oil"
    
    #Save the new name and asserting it to save test the ability to Update record.
    assert todo_list_items1.save
    
    #The abilty to destroy todo_list1 object test the DB Delete record action
    assert todo_list_items1.destroy
  end
end
