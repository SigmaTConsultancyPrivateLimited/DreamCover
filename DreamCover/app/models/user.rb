class User < ApplicationRecord
    # has_many :addresses
	
	# has_one :return
	# has_many :orders
	# has_many :deliveries
	# has_many :cancellation

	# has_many :carts
	# has_many :products, through: :carts

    mount_uploader :file_extension, ImageUploader
	# validates_presence_of  :email
	validates_uniqueness_of :email  
	# ,conditions:->{where(is_active: true)} 
end


