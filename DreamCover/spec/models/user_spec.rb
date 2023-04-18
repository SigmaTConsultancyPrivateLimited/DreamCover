# require 'spec_helper'
require 'rails_helper'
RSpec.describe User, type: :model do
    describe "validations" do
     
      it 'column values validation' do
        is_expected.to validate_presence_of(:email)
        is_expected.to validate_uniqueness_of(:email)
    end
    end
  end
  