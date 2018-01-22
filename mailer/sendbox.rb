class SandoboxEmailInterceptor
  def self.delivering_email(message)
    message.to = ['sandbox@ex.com']
  end
end

