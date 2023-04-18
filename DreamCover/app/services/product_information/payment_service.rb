module ProductInformation
	class PaymentService

		def self.get_payment
			data = Payment.all
		end

		def self.new_payment
			data = Payment.new 
		end

		def self.edit_payment(payment_id)
			data = Payment.find(payment_id)
		end

		def self.update_payment(payment_id, params)
			data = Payment.find(payment_id)
			if data.update
				return true
			else
				return false
			end
		end

		def self.create_payment(params)
			data = Payment.create(params)
		end

		def self.delete_payment(payment_id)
			data = Payment.find(payment_id)
			data.update(is_active: false)
		end
	end
end