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
  
  test "items of todo list" do
    #create a new List object using the name field from first record in the text fixtures/lists.yml 
    todo_list_items1 = Item.new :name => items(:items_one).name,
                                :description => items(:items_one).description,
                                :due_date => items(:items_one).due_date,
                                :list_id => items(:items_one).list_id

    #This assertion test that saving the book object is successful: Test the ability to create DB record
    assert todo_list_items1.save

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
