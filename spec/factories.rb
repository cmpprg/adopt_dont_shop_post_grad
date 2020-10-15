require 'faker'

FactoryBot.define do

  factory :shelter do
    name { Faker::Company.unique.name }
    address { Faker::Address.unique.street_address }
    city { Faker::Address.unique.city }
    state { Faker::Address.unique.state_abbr }
    zip { Faker::Address.unique.zip_code }
  end

  factory :pet do
    image { Faker::Company.unique.name }
    name { Faker::Address.unique.street_address }
    age { Faker::Address.unique.city }
    sex { Faker::Address.unique.state_abbr }

    shelter
  end
end
