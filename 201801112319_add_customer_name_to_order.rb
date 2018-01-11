class AddCustomerNameIndexToOrders < ActiveRecord::Migration
def change
add_index :orders, :name
end

#primary_key:
create_table :tickets, primary_key: :number do |t|
t.text :description
	
t.timestamps
end

#no primary_key:
crate_table :authors_books, id: false do |t|
	t.integer :author_id, null: false
	t.integer :book_id,   null: false
end

end

