class User < ActiveRecord::Base

	has_one :partner, class_name: 'User', foreign_key: :partner_id

	def self.find_by_phone phone
		phone_number = PhoneNumber.new phone
		return false unless phone_number.is_valid?

		user = self.find_by phone: phone_number.to_s

		return user
	end

end