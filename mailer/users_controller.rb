class UserController < ApplicationController
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        UserMailer.welcome_email().deliver_later
	format.html { redirect_to(@user, notice: 'text') }
	format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
	format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end

#cronjob
#deliver_now
class SendWeeklySummary
  def run
    User.find_each do |user|
      UserMailer.weekly_summary(user).deliver_now
    end
  end
end

#mime_type
attachements['filename.jpg'] = File.read('/path/to/filename.jpg')

#action mailer
encoded_content = 
SpecialEncode(File.read('/path/to/filename.jpg'))
attchments['filename.jpg'] = {
  mime_type: 'application/x-gzip',
  encoding: 'Special Encoding',
  content: encoded_content
}

#attachments
def welcome
  attachments.inline['image.jpg'] =
  File.read('/path/to/image.jpg')
end

#image_tag
<%= image_tag attachments['image.jpg'].url, alt: 'My photo', class: 'photos'%>


#to:
class AdminMailer < AcitionMailer::Base
  default to: Proc.new { Admin.pluck(:email) },
	  form: 'notification@ex.com'

  def new_registration(user)
    @user = user
    mail(subject: "New User Signup: #{@user.email}")
  end
end

#:cc, :bcc
def welcome_email(user)
  @user = user
  emial_with_name = %("#{@user.name}" <#{@user.emial}>)
  mail(to: email_with_name, subject: 'Welcome to My Awesome Site')
end


