require 'factory_bot_rails'

Shelter.destroy_all

shelter_1 = FactoryBot.create(:shelter)
shelter_2 = FactoryBot.create(:shelter)
shelter_3 = FactoryBot.create(:shelter)

FactoryBot.create(:pet, shelter: shelter_1)
FactoryBot.create(:pet, shelter: shelter_1)
FactoryBot.create(:pet, shelter: shelter_1)
FactoryBot.create(:pet, shelter: shelter_2)
FactoryBot.create(:pet, shelter: shelter_2)
FactoryBot.create(:pet, shelter: shelter_2)
FactoryBot.create(:pet, shelter: shelter_3)
FactoryBot.create(:pet, shelter: shelter_3)
FactoryBot.create(:pet, shelter: shelter_3)
