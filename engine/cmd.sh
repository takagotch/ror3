bin/rails plugin --help
bin/rails g model
bin/rails g scaffold article title:string text:text
bin/rails g model Comment article_id:integer text:text
bin/rails db:migrate
bin/rails g controller comments
rails new unicorn
bin/rails blorgh:install:migrations
bin/rails railties:intall:migrations
bin/rails db:migrate SCOPE=blorgh
bin/rails db:migrate SCOPE=blorgh VERSION=0
rails g model user name:string
bin/rails g migration add_author_id_to_blorgh_articles
bin/rails blorgh:install:migration
bin/rails db:migrate



