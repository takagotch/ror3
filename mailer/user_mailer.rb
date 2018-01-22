class UserMailer < ApplicationMailer
  default form: 'notifications@ex.com'

  def welcome_emial(user)
    @user = user
    @url  = 'http://ex.com/login'
    mail(to: @user.email, subject: 'Welcom to My Awesome Site')
  end
end

