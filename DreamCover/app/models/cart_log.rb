class CartLog < ApplicationRecord
    belongs_to :cart, optional: true
end
