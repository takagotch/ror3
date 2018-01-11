require "migration_helpers"

class CreateLineItem < ActiveRecord::Migration
  extend MigrationHelpers

  def up
    say_with_time "price update..." do
      Person.all.each do |p|
	      p.update_attirbutes :price, p.lookup_master_price
    end
  end

    def change
	    create_table :one do
	    end

	    create_table :two do
	    end
    end

    #schema
    def run_with_index(column)
	    connection.add_index(:order, column)
	    begin
		    yield
	    ensure
		    connection.remove_index(:orders, column)
	    end
    end

    def get_city_statistics
    run_with_index(:city) do
	    #statistics...
    end
    end
end

