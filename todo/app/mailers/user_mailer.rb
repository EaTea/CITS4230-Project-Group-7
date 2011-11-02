class UserMailer < ActionMailer::Base
  default :from => "todo-notifier@shared-todo.com"
  #  User.all.each do |user|
  def fetch_users_due_items(usr)
    lists = User.find_by_id(usr.id).lists
    
    list_items_due = Array.new 
      
    lists.each do |list|
      list_items_due.insert(list.items.find_all_by_due_date(Date.today))
    end
    
    list_items_due.flatten
  end
  
   def todo_notification(user) 
    #@user = user
    list_items_due = self.fetch_users_due_items(user)
    mail(:to => "#{user.username} <#{user.email}>", :subject => "Your have Pending To-Do task!")
  end
end
