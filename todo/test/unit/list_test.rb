require 'test_helper'
#require '../../test_helper'

class ListTest < ActiveSupport::TestCase
	
  fixtures :lists
  
  test "name is nonempty" do
		list = List.new
		assert list.invalid?
		assert list.errors[:name].any?
	end
  
   

   test "todo list" do
    #create a new List object using the name field from first record in the text fixtures/lists.yml 
    todo_list1 = List.new :name => lists(:list_one).name

    #This assertion test that saving the book object is successful: Test the ability to create DB record
    assert todo_list1.save

    todo_list1_copy = List.find(todo_list1.id)

    #test the success of retrieval: Test the ability to read DB record
    assert_equal todo_list1.name, todo_list1_copy.name

    #Assigning new name for todo_list1 object
    todo_list1.name = "This is Sample List"
    
    #Save the new name and asserting it to save test the ability to Update record.
    assert todo_list1.save
    
    #The abilty to destroy todo_list1 object test the DB Delete record action
    assert todo_list1.destroy
  end

	#test "list association to items is correct" do
	#	list = List.new(name: "Groceries")
	#end
end
