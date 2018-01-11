def  change

	#class Order < ActiveRecord::Base; end
	#class OrderHistory < ActiveRecord::Base; end
	
create_table :order_histories do |t|
	t.integer :order_id, null: false
	t.text :note

	t.timestamps
end

order = Order.find :first
OrderHistroy.create(order_id: order, notes: "test")
end

