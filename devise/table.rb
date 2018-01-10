class CreateTasks < ActiveRecord::Migration
	def self.up
	create_table :tasks do |t|
		t.integer :user_id
		t.string  :name

		t.timestamps
	end
end

