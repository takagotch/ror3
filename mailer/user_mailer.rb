#
class UserMailer < ApplicationMailer
  default form: 'notifications@ex.com'

  def welcome_emial(user)
    @user = user
    @url  = 'http://ex.com/login'
    mail(to: @user.email, subject: 'Welcom to My Awesome Site')
  end
end

#after_action, before_action, around_action
class UserMailer < ApplicationMailer
  after_action :set_delivery_options,
	       :prevent_delivery_to_guests,
	       :set_bussiness_headers

  def feedback_message(bussiness, user)
    @business = business
    @user = user                     
    mail                             #self
  end

  def campaign_message(bussiness, user)
    @business = business
    @user = user
  end

  private

  def set_delivery_options
    if @business && @business.has_smtp_settings?
      mail.delivery_method.settings.merge!(@business.smtp_settings)
    end
  end

  def prevent_delivery_to_guests
    if @user && @user.guest?
      mail.perform_deliveries = false
    end
  end

  def set_bussiness_headers
    if @business
      headers["X-SMTPAPI_CATEGORY"] = @business.code
    end
  end
end

#recieve
#/bin/rails runner 'UserMailer.receive(STDIN.read)'
class UserMailer < ApplicationMailer
  def receive(email)
    page = Page.find_by(address: email.to.first)
    page.emails.create(
      subject: email.subject,
      body: email.body
    )

    if email.has_attachemetns?
      email.attachements.each do |attachment|
        page.attachments.create({
	  file: attachment,
	  description: email.subject
	})
      end
    end
  end
end

#:content_type
#text/plain #default
class UserMailer < ApplicationMailer
  def welcome_email(user, email_body)
    mail(to: user.emial,
	body: email_body,
	content_type: "text/html",
	subject: "")
  end
end

#delivery_method_options:
#.smtp_user
class UserMailer < ApplicationMailer
  def welcome_email(user, company)
    @user = user
    @url  = user_url(@user)
    delivery_options = { user_name: company.smtp_user,
			 password: company.smtp_password,
			 address: company.smtp_host }
    mail(to: @user.email,
	subject: "",
	delivery_method_options: delivery_otions)
  end
end

