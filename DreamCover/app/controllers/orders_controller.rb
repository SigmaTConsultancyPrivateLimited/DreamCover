class OrdersController < ApplicationController
	 skip_before_action :verify_authenticity_token
	 require 'securerandom'
	def get_order
		@data = ProductInformation::OrderService.get_order
		render :json =>  @data
	end

	def order_index
		# byebug
	
		
		@user_info = ProductInformation::CartService.cart_index( session[:current_user_id])
		order_id =  SecureRandom.alphanumeric(8)
		@cart_data =  Cart.where(cart_unique_id: @user_info.cart_unique_id )
		product_id_array = [] 
		@product_price = []
        @cart_data.each do |x|
			product_unique_id = x[:product_unique_id]
			product_id_array << product_unique_id
			@order = ProductInformation::OrderService.new_order(@user_info.unique_id ,product_unique_id , order_id ,@user_info.first_name,  @user_info.city , @user_info.file_extension)
			@cart_total_price = @product_price.push(x.product_price* x.product_quantity).sum
		end
		session[:order_id] = order_id

		@order_info = Order.where(order_unique_id:  session[:order_id])
		

		# ------------------------------------------------------------------
		invoice_id =  SecureRandom.alphanumeric(8)
		@invoice = invoice = Invoice.new(invoice_unique_id: invoice_id , cart_unique_id:@user_info.cart_unique_id, user_unique_id: @user_info.unique_id  )
		@invoice.save
		session[:current_invoice_id] = @invoice.invoice_unique_id
		 
		
		# order_log = OrderLog.create( order_log_unique_id: order_id, customer_name: @user_info.first_name, customer_address: @user_info.city, delivery_status: "Pending",user_profile: @user_info.file_extension)
		# order_log.save

		#---------------------------------------------------
		
        @time = Time.now
		# OrderMailer.order_email(@user_info,@time,session[:current_invoice_id],@cart_data, @cart_total_price).deliver_now
		
	end

	def get_order_logs
		byebug
		order = Order.all
		render :json =>  order
	end


	def new_incident
		# order = Order.all
		# render :json =>  order	
	end

	def incident_form
		order = Order.all
		# render :json =>  order	
	end
	

	def delivery_index
		# byebug
		user_detail = ProductInformation::CartService.cart_index( session[:current_user_id])
	end



	# def create_order
	# 	byebug
	# 	@order = ProductInformation::OrderService.create_order(order_params)
	# 	head :no_content
	# end


	def invoice_generate
		# byebug
		@product_price = []
        @cart = ProductInformation::CartService.cart_details(session[:current_user_id])  
        @cart.each do |x|
            @cart_total_price = @product_price.push(x.product_price* x.product_quantity).sum
        end
        # render json: [@cart, @cart_total_price ]
	end

	def invoice_download
		# byebug
		@product_price = []
        @cart = ProductInformation::CartService.cart_details(session[:current_user_id])  
        @cart.each do |x|
            @cart_total_price = @product_price.push(x.product_price* x.product_quantity).sum
        end
		@time = Time.now


		@user_info = User.find_by(unique_id:  session[:current_user_id])
		pdf_options = {
			page_size: 'A4',
			margin: {
			  top: '1in',
			  bottom: '1in',
			  left: '1in',
			  right: '1in'
			},
			footer: {
			  html: {
				template: 'layouts/pdf_footer.html.erb',
				locals: {
				  page_size: 'A4'
				}
			  }
			},
			header: {
			  html: {
				template: 'layouts/pdf_header.html.erb',
				locals: {
				  page_size: 'A4'
				}
			  }
			},
			# Add your custom CSS styles here
			stylesheets: ['https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'],
			# Set the text color to red
			# You can use any valid CSS color value here, such as hex codes or named colors
			color: 'red'
		  }
		  
		pdf = WickedPdf.new.pdf_from_string(render_to_string("invoice_download", layout: 'pdf_layout'))  
		send_data(pdf, filename: "Invoice.pdf", type: "application/pdf")

		#for mail
		# @data = ProductInformation::DeliveryService.create_delivery()
		
		# OrderMailer.invoice_email.deliver
  	end
	

	private
	
	def order_params
		
		params.permit(:order)
	end
end
