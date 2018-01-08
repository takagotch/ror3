#callback
class Order < ActiveRecord::Base
before_validation :normalize_credit_card_number

after_create do |order|
	logger.info "#{order.id}"
end

protected
def normalize_credit_card_number
	self.cc_number.gsub!(/[-\s]/, '')
end
end
#normalize_credit_card_number
class CreditCardCallbacks
def before_validation(model)
	model.cc_number.gsub!(/[-\s]/, '')
end
end
#before_validation
class Order < ActiveRecord::Base
	before_validation CreditCardCallbacks.new
end
class Subscription < ActiveRecord::Base
	before_validation CreditCardCallbacks.new
end

