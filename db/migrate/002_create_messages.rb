class CreateMessages < ActiveRecord::Migration
	def change
		create_table :messages do |table|
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
