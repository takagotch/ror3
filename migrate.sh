ls db/migrate
rails g model discount
rails g migration add_price_column

rake db:migrate
rake db:migrate VERSION=201801112124
rake db:migrate:redo STEP=3

sqlite3 db/development.sqlite3 ".schema tickets"

rails_env=production rake db:migratae

Order.find(1).name
Order.find(1).line_items

LineItem.format = :xml
li = LineItem.find(:all, :params => {:order_id=>1}).first
puts li.price
li.price*=0.8

li2 = LineItem.new(:order_id=>1, :product_id=>2, :quantity=>1, :price=>0.0)
li2save


