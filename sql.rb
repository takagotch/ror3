#.where()
pos = Order.where("name = 'Dave' and pay_type = 'po'")

#NO escape
name = params[:name]
pos = Order.where("name = '#{name}' and pay_type = 'po'")
# escape
name = params[:name]
pos = Order.where(["name = ? and pay_type = 'po'", name])
#
name = params[:name]
pay_type = params[:pay_type]
pos = Order.where("name = :name and pay_type = :pay_type",
		 pay_type: pay_type, name :name)
#
pos = Order.where("name = :name and pay_type = :pay_type",
		 params[:order])
pos = Order.where(params[:order])
pos = Order.where(name: params[:name],
		  pay_type: params[:pay_type])

#NO
User.where("name like '?%'", params[:name])
#like
User.where("name like ?", params[:name]+"%")

#order()
orders = Orders.where(name: 'xxx')
order("pay_type, shipped_at DESC")

#limit()
orders = Order.where(name: 'Dave')
order("pay_type, shipped_at DESC").
	limit(10)

#offset(). limit()
def Order.find_on_page(page_num, page_size)
	order(:id).limit(page_size).offset(page_num*page_size)
end
#select()
list = Talk.select("title, speaker, recorded_on")

#joins()
Linetem.select('li.quantity')
where("pr.title = 'xxx'").
joins("as li inner join products as pr on li.product_id = pr.id")
#readonly()
#group()
summary = LineItem.select("sku, sum(amount) as amount").group("sku")
#lock()
Account.transaction do
	ac = Account.where(id: id), lock("LOCK IN SHAPE MODE").first
	ac.balance -= amount if ac.balance > amount
	ac.save
end


average = Order.average(:amount)
max     = Order.maximum(:amount)
min     = Order.minimum(:amount)
total   = Order.sum(:amount)
number  = Order.count
#where().minimum()
Order.where("amount > 20").minimum(:amount)
#maximum().group()
result = Order.maximum(:amount).group(:state)
puts result
#order(). group()
result = Order.group(:state).
	order("max(amount) desc").
	limit(3)

#scope
class Order < ActiveRecord::Base
scope :last_n_days, lambda { |days| where('updated < ?', days) }
socpe :last_n_days -> { |days| where('updated < ?', days) }
end
orders = Order.last_n_days(7)

class Order < ActiveRecord::Base
scope :checks, where(pay_type: :check)
end
orders = Order.checks.last_n_days(7)
#escape
inhouse = Order.where('email LIKE "%@ex.com"')

in_house.checks.last_n_days(7)




