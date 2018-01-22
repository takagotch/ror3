##find_by_sql
Client.find_by_sql("SELECT * FROM clients
		   INNER JOIN orders ON clients.id = orders.client_id
		   ORDER BY clients.created_at desc")
#=> [
#  #<Client id: 1, first_name: "tky" >,
#  #<Client id: 2, first_name: "taka" >,
#
#]

##ids
#SELECT id form people
Person.ids
#SELECT person_id FROM people
class Person < ApplicationRecord
  self.primary_key = "person_id"
end
Person.ids

##select_all
Client.conenction.select_all("SELECT first_name, created_at FROM clients WHERE id = '1'")
#=>[
#  {},
#  {}
#
#]

##pluck
Client.where(active: true).pluck(:id)
Client.distinct.pluck(:role)
Client.pluck(:id, :name)












