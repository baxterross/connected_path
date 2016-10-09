class CreateUsers < ActiveRecord::Migration
	def change
			create_table :users do |table|

			table.string :identifier
			table.string :type
			table.string :to_number
			table.string :from_number
			table.string :text
			table.boolean :sent

			table.timestamps null: false
		end
	end
end
