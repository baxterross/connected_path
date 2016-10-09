class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |table|
			table.string :name
			table.json :issues
			table.string :phone_number
			table.integer :partner_id

			table.timestamps null: false
		end
	end
end
