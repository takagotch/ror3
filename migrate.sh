ls db/migrate
rails g model discount
rails g migration add_price_column

rake db:migrate
rake db:migrate VERSION=201801112124
rake db:migrate:redo STEP=3

sqlite3 db/development.sqlite3 ".schema tickets"

rails_env=production rake db:migratae
