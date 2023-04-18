module ProductInformation
	class DeliveryService

	
		def self.delivery_index(unique_id)
            # byebug
            user_data = User.find_by(unique_id: unique_id)
			cart_details = Cart.find_by(cart_unique_id: user_data.cart_unique_id)
			return user_data,cart_details
        end

		def self.create_delivery()
			byebug
			@data = Delivery.new()
			if @data.save
				DeliveryMailer.invoice_email.deliver

				puts "Payment Delivered Successfully"
			end
		end
	end
end
