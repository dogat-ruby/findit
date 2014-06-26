class AdminMailer < ActionMailer::Base
  default from: "admin@findit.com"

  def notify_new user
  	@user = user
	to = 'admin@findit.com'
    to = 'dogatuncay@hotmail.com' if Rails.env.production?
    mail(to: to, subject: 'New User Signed Up')
  end 
end
