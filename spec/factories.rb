require 'faker'

FactoryBot.define do

  factory :shelter do
    name { "#{Faker::Company.unique.name} Shelter" }
    address { Faker::Address.unique.street_address }
    city { Faker::Address.unique.city }
    state { Faker::Address.unique.state_abbr }
    zip { Faker::Address.unique.zip_code }
  end

  factory :pet do
    image { Faker::Avatar.image }
    name { Faker::Name.unique.name_with_middle }
    age { Faker::Number.between(from: 1, to: 15) }
    sex { ['Male', 'Female'].sample }
    description { Faker::Books::Dune.saying }

    shelter
  end
end
