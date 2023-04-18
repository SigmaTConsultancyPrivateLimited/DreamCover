class Discount < ApplicationRecord
    has_many :product_discounts
	has_many :products, through: :product_discounts
end
