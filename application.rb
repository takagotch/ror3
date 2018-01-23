config.active_record.observers = :order_observer, :audit_obserber

config.x.payment_processing.shedule = :daily
config.x.payment_processing.retries = 3
config.super_debugger = true

Rails.configuration.x.payment_processing.schedule #=> :daily
Rails.configuration.x.payment_processing.retries  #=> 3
Rails.configuration.x.payment_rpcessing.not_set   #=> nil
Rails.configuration.x.super_debugger              #=> true

module MyApp
  class Applicatin < Rails::Application
    config.payment = config_for(:payment)
  end
end

Rails.configuration.payment['merchant_id'] #=> production_merchant_id or development_merchant_id


