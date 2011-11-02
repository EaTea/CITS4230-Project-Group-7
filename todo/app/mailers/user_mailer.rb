class UserMailer < ActionMailer::Base
  default :from => "todo-notifier@shared-todo.com"
  #  User.all.each do |user|
  def fetch_users_due_items(usr)
    lists = User.find_by_id(usr.id).lists
    
    list_items_due = Array.new 
      
    lists.each do |list|
      list_items_due.concat(list.items.where('completed = "f" and due_date <= ?', Date.today))
    end
    
    list_items_due.flatten
  end
  
   def todo_notification(user) 
    list_items_due = self.fetch_users_due_items(user)
		num_items_due = list_items_due.size
		puts num_items_due
		if num_items_due
			email_subject = "ForgetMeNot: You have " + num_items_due.to_s + " due!"
	   	mail(:to => "#{user.username} <#{user.email}>", :subject => email_subject)
		end
  end
end
