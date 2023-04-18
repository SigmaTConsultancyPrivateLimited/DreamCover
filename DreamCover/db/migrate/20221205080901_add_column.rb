class AddColumn < ActiveRecord::Migration[7.0]
  def change
    # ---------------------------------Products-----------------------
    add_column :products, :product_name, :string
    add_column :products, :product_code, :integer
    add_column :products, :product_image, :string
    add_column :products, :price, :integer
    add_column :products, :quantity, :integer


    # -----------------------------------Users------------------------------------
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :email, :string
    add_column :users, :password, :integer
    add_column :users, :phone_number, :integer
    add_column :users, :file_extension, :string
    add_column :users, :language, :string

    #----------------------------Carts----------------------------------------------- 
    add_column :carts, :product_id, :integer
    add_column :carts, :total_items, :integer
    add_column :carts, :sub_total, :integer
    add_column :carts, :total_unique_items, :integer
    add_column :carts, :available_discounts, :boolean
    add_column :carts, :currency, :string
    add_column :carts, :user_id, :integer


    # ---------------------------------deliveries------------------------------
    # # add_column :deliveries, :order_id, :integer
    # add_column :deliveries, :delivery_partner_id, :integer
    # add_column :deliveries, :delivery_status_id, :integer  
    # add_column :deliveries, :cancellation_id, :integer

    # ----------------------------orders------------------------------
    add_column :orders, :user_id, :integer
    add_column :orders, :total, :integer
    add_column :orders, :cart_id, :integer
    add_column :orders, :payment_id, :integer
    add_column :orders, :quantity, :integer

    # ------------------------Payments-----------------------------------
    add_column :payments, :payment_customer_id, :integer
    add_column :payments, :payment_desc, :string 
    add_column :payments, :payment_amount, :string
    add_column :payments, :date, :datetime

    # -------------------------Addresses------------------------------------
    add_column :addresses, :flat_no, :string
    add_column :addresses, :house_name, :string
    add_column :addresses, :street_name, :string
    add_column :addresses, :city_id, :integer
    add_column :addresses, :district_id, :integer
    add_column :addresses, :state_id, :integer
    add_column :addresses, :country_id, :integer
    add_column :addresses, :pincode, :integer

  end
end
