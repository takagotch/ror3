class CreateOrderHistories < ActiveREcord::Migration
def change
create_table :order_histories do |t|
	t.integer :order_id, null: false
	t.text :notes

	t.timestamps
end
end

end

