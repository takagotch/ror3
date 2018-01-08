#.find()
an_order = Order.find(27)
product_list = params[:product_ids]
total = Product.find(product_list).sum(&:price)

order = Order.find_by_name("")
orders = Order.find_all_by_name("")
orders = Order.find_all_by_email(params['email'])
orders = Order.find_all_by_address(params['address'])

order = Order.find_by_name!("xxx") #=> ActiveRecord::RecordNotFound !nil

#find_by_
#find_all_by
#.where()
user = User.find_by_name_and_password(name, pw)
user = User.where(name: name, pasword: pw).first

#find_or_initialize_by_()
#find_or_creaet_by_()
cart = Cart.find_or_initialize_by_user_id(user.id)
cart.items << new_item
cart.save


#find_by_sql()
orders = LineItem.find_by_sql("select line_items.* from line_items, orders " +
			      " where order_id = orders.id " +
			      " and orders.name = 'xxx' ")
#attributes()
orders = Order.find_by_sql("select name, pay_type from orders")
first = orders[0]
p first.attributes 
p first.attribute_names
p first.attribute_present?("address")

#find_by_sql()
items = LineItem.find_by_sql("select *,
			      products.price as unit_price, " +
			      " quantity*products.price as total_price, " +
			      " products.title as title " +
			      " products.title as title " +
			    " from lile_items, products " +
			    " where line_items.product_id = products.id ")
li = items[o]
puts "#{li.quantity}: #{li.unit_price}x#{li.unit_price} => #{li.total_price}"
Order.find_by_sql(["select * from orders where amount > ?",
	params:[:amount])

#reload()
stock = Market.find_by_ticker("xxx")
loop do
	puts "Price = #{stock.price}"
	sleep 60
	stock.reload
end


order = Order.find(123)
order.name = "Taka"
order.save
#find_by_sql("select * from * where id=123")
orders = Order.find_by_sql("select id, name, pay_type from orders where id=123")
first = orders[0]
first.name = "Wilma"
first.save
#update_attributes()
order = Order.find(123)
order.update_attirbutes(:name, "Taka", email: "taka@ex.com")
#update_attributes()
def save_after_edit
	order = Order.find(params[:id])
	if order.update_attributes(params[:order])
		reditect_to action: :index
	else
		render action: :edit
end

#update()
order = Order.update(12, name: "Taka", email: "taka@ex.com")
#update_all()
result = Product.update_all("price = 1.1*price", "title like '%xxx%'")
#save!, create!
if order.save
else
end







