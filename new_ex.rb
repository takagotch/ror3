an_order = Order.new
an_order.name     = "ooo",
an_order.email    = "xxx",
an_order.address  = "123 Mani St",
an_order.pay_type = "check",
an_order.save    

Order.new do |o|
	o.name = "xxx",
	o.email = "",
	o.address = "",
	o.pay_type = "",
	o.save
end

an_order = Order.new{
  name: "",
  email: "",
  address: "",
  pay_type: "",}
an_order.save

an_order = Order.new
an_order.name = "",
an_order.email = "",
an_order.address = "",
an_order.pay_type = "",
an_order.save
puts "#{an_order.id}"

#.create()
an_order = Order.create(
name: "",
email: "",
address: "",
pay_type: "")

orders = Order.create(
[{ name: "",
   email: "",
   address: "",
   pay_type: ""
},
{ name: ""
  email: ""
  address: ""
  pay_type: ""
} ] )

