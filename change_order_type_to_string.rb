class ChangeOrderTypeToString < ActiveRecord::Migration
def up
change_column :orders, :order_type, :string, null: false
end

def down
raise ActiveRecored::IrreverasibleMigration
end

end

