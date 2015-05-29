class UserMailer < ActionMailer::Base
  default from: "raymond_033@hotmail.com"

  def welcome_email(user)
    @user = user
    @url = 'http://example.com/login'
    mail to: user.email, subject: 'Welcome to Rotten Mangoes'
  end

  def user_delete_notification(user)
    @user = user
    @url = 'http://example.com'
    mail to: user.email, subject: 'User Account Deleted'
  end
  
end
