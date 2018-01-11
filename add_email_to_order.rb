class AddEmailToOrders < ActiveRecord::Migration
def up
add_column :orders, :e_mail, :string
end

def down
remove_column :orders, :e_mail
end

def change
add_column :orders, :e_mail, :string
end

end

add_column :orders, :palced_at, datetime, default: Time.now
add_column :orders, :order_type, :integer
add_column :orders, :ship_class, :string, null: false, default: 'priority'
add_column :orders, :amount, :decimal, precision: 8, scale:2



