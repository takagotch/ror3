Order.column_names
=>["id", "name", "address", "email", "pay_type", "created_at", "updated_at"]

sqlite3 -line db/development.sqlite3 "select * from orders limit 1"

