# spec/factories/user.rb

FactoryBot.define do
    factory :user do
        first_name { Faker::Name.first_name }
        last_name { Faker::Name.last_name }
        email { Faker::Internet.email }
        phone_number { '978456123' }
        # is_active { true }
      end
  end
  