require 'faker'

FactoryBot.define do
  factory :pet do
    image { Faker::Company.unique.name }
    name { Faker::Address.unique.street_address }
    age { Faker::Address.unique.city }
    sex { Faker::Address.unique.state_abbr }
    
    association factory: :shelter
  end
end
