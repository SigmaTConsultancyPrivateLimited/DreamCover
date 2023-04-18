require 'rails_helper'

RSpec.describe Wishlist, type: :model do

  context "model validation" do

    it "validates model association" do
      is_expected.validate_uniqueness_of(:product_unique_id).scoped_to(:user_unique_id).with_options(is_active: true)
    end
  end
end
