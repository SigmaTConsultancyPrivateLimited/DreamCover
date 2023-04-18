class DeliveriesController < ApplicationController
	skip_before_action :verify_authenticity_token
	def get_delivery
		# byebug
		@user_info = ProductInformation::DeliveryService.delivery_index( session[:current_user_id])
		@product_price = []
        @user_info[1].each do |x|
            @cart_total_price = @product_price.push((x.product_price * 28.98/100)* x.product_quantity).sum
        end
        render json: [user_info[1], @cart_total_price ]
	end

	def create_delivery
		byebug
		@data = ProductInformation::DeliveryService.create_delivery(params_del)
		head :no_content
	end

	def cancel_delivery
		byebug	
		# Set your API key
		Stripe.api_key = "pk_test_51MJ8uISEvkY5149VeGbWjgy4QDXpcfxA0EjRztXHvRYwcBJVoomCMGxLZGJZIKR9qNN3YOmWELkbpqK8mKrkog1i00mojVv8JM"
		# Get the ID of the charge to be refunded
		
		charge = Stripe::Charge.retrieve('ch_1234567890')
		# Get the charge ID
		charge_id = charge.id

		# Create a refund for the full amount of the charge
		
		
		refund = Stripe::Refund.create({
			charge: charge_id,
			amount: 1000,
			reason: 'requested_by_customer',
			currency: "usd"
		  })
		# Print the ID of the refund object
		puts refund.id
	end
	
	

	private
	
	def params_del
		byebug
		# params.require(:delivery).permit(:order_id, :delivery_partner, :delivery_status_id, :cancellation_id)
		params.permit(:delivery)
	end
end
