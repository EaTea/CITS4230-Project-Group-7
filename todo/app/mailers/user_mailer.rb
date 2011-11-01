class UserMailer < ActionMailer::Base
  default :from => "todo-notifier@shared-todo.com"
  
  def todo_notification(user)
    @user = user
    mail(:to => "#{user.username} <#{user.email}>", :subject => "Your have Pending To-Do task!")
  end
end
