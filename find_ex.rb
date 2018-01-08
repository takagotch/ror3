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
orders = LineItem.find_by_sql("" +
			      "" +
			      "")
#attributes()
orders = Order.find_by_sql("select name, pay_type from orders")
first = orders[0]
p first.attributes 
p first.attribute_names
p first.attribute_present?("address")

#find_by_sql()
items = LineItem.find_by_sql(",
			     " +
			    "" +
			    "" +
			    "" +
			    "" +
			    "")
li = items[o]
puts "#{}: #{}x#{} => #{}"
Order.find_by_sql([
	params:[:amount])

#reload()
stock = Market.find_by_ticker("xxx")
loop do
	puts ""
	sleep 60
	stock.reload
end


