require 'faker'

FactoryBot.define do
  factory :shelter do
    name { Faker::Company.unique.name }
    address { Faker::Address.unique.street_address }
    city { Faker::Address.unique.city }
    state { Faker::Address.unique.state_abbr }
    zip { Faker::Address.unique.zip_code }
  end
end
