class RenameEmailColumn < ActiveRecord::Migration
def change
rename_column :orders, :e_mail, :customer_email
end

def up
change_column :orders, :oreder_type, :string
end

def down
change_column :orders, :order_type, :integer
end

end

