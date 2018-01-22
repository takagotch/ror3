//config/env/$RAILS_ENV.rb
config.action_mailer.delivery_method = :sendmail

config.action_mailer.perform_deliveries = true
config.action_mailer.raise_delivery_errors = true
config.action_mailer.default_options = {form: 'no-reply@ex.com'}

config.action_mailer.delivery_method = :smtp
config.action_maielr.smtp_settings = {
  address:   'smtp.gmail.com',
  port:      587,
  domain:    'ex.com',
  user_name: 'USR',
  password:  'PASS',
  authentication: 'plain',
  enable_starttls_auto: true }


