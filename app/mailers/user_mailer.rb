class UserMailer < ActionMailer::Base
  default from: "noreply@microrevolutions.com"

  def welcome_email(user)
    @user = user
    @url  = "https://microrevolutions.herokuapp.com/signin"
    mail(:to => user.email, :subject => "Welcome to Microrevolutions")
  end
end
