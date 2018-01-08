class Encrypter
def initialize(attrs_to_manage)
	@attrs_to_manage = attrs_to_manage
end
def before_save(model)
	@attrs_to_manage.each do |field|
		model[field].tr!("a-z", "b-za")
	end
end
def after_save(model)
	@attrs_to_manage.each do |field|
		model[field].tr!("b-za", "a-z")
	end
end

alias_method :after_find, :after_save
end

#after_find()
require "encrypter"
class Order < ActiveRecord::Base
	encrypter = Encrypter.new

	before_save encrypter
	after_save encrypter
	after_find encrypter

protected
def after_find
end
end

#ActiveRecord::Base
class ActiveRecord::Base
	def self.encrypt(*attr_names)
		encrypter = Encrypter.new(attr_names)

		before_save encrypter
		after_save encrypter
		after_find encrypter

		define_method(:after_find) { }
	end
end

#attributes :name, :email
class Order < ActiveRecord::Base
	encrypter(:name, :email)
end

#>rubt encrypt.rb
#>sqlite3 -line db/development.sqlite3 "select * from orders"
o = Order.new
o.name = "xxx"
o.address = "123 The Street"
o.email = "dev@ex.com"
o.save
puts o.name

o = Order.find(o.id)
puts o.name

#
class OrderObserver < ActiveRecord::Observer
def after_save(an_order)
	an_order.logger.info("#{an_order.id}")
end


