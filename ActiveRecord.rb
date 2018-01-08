#Fixnum_obj 1
#attr_accessor :name
o = Order.find(1)
puts o.name
o.name = "Taka Yoshi"

#xxx_before_type_cast
#attr_reader :price, :time
product.price_before_type_cast
product.updated_at_before_type_cast

#boolean_check ?
user = User.find_by_name("Taka")
if user.superuser?
	grant_privileges
end

#
created_at, created_on, updated_at, updated_on
lock_version
type
id
xxx_id
xxx_count

class LegacyBook < ActiveRecord::Base
	self.primary_key = "isbn"
end

book = LegacyBook.new
book.id = "0-12345-6789"
book.title = "My Great American Novel"
book.save
book = LegacyBook.find("0-12345-6789")
puts book.title   #=>"xxx"
p book.attributes #=> {"isbn" => "0-12345-6789", "title" => "xxx"}

#one :one
#order_id :id
class Invoice < ActiveRecord::Base
belongs_to :order
end
class Order < ActiveRecord::Base
has_one :invoice
end

#one :many
#order_id :id
class LineItem < ActiveRecord::Base
belongs_to :order
end
class Order < ActiveRecord::Base
has_many :line_items
end

#many :many
#categories_products
class Category < ActiveRecord::Base
has_and_belongs_to_many :products
end
class Product < ActiveRecord::Base
has_and_belongs_to_many :categories
end
class CategoryProduct < ActiveRecord::Bae
end



