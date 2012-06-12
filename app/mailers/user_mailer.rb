class UserMailer < ActionMailer::Base
  default :from => "invite@i-hookah.com"

  def welcome_email(user)
  	mail(:to => user.email, :subject => "Invitation Request Received")
  	headers['X-MC-Track'] = "opens, clicks"
  	headers['X-MC-GoogleAnalytics'] = "i-hookah.com"
  	headers['X-MC-Tags'] = "welcome"
  end
end
