class UserMailer < ApplicationMailer
  default form: 'notifications@ex.com'

  def welcome_emial(user)
    @user = user
    @url  = 'http://ex.com/login'
    mail(to: @user.email, subject: 'Welcom to My Awesome Site')
  end
end


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



