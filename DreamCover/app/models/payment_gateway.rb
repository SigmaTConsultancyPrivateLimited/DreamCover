class PaymentGateway < ApplicationRecord
    belongs_to :payment, optional: true
end
