require 'rails_helper'

RSpec.describe 'As a user on the shelter pets index page' do
  it "I can see each pet that can be adopted from a particular shelter" do
    shelter_1 = create(:shelter)
    shelter_2 = create(:shelter)

    pet_1 = create(:pet, shelter: shelter_1)
    pet_2 = create(:pet, shelter: shelter_1)
    pet_3 = create(:pet, shelter: shelter_1)
    pet_4 = create(:pet, shelter: shelter_2)

    visit "/shelters/#{shelter_1.id}/pets"

    within('.shelter-pets-list') do
      within("#shelter-pets-list-item-#{pet_1.id}") do
        expect(page).to have_content(pet_1.name)
        expect(page).to have_content(pet_1.age)
        expect(page).to have_content(pet_1.sex)

        pet_1_image = find('img')
        expect(pet_1_image[:src]).to eql(pet_1.image)
      end

      within("#shelter-pets-list-item-#{pet_2.id}") do
        expect(page).to have_content(pet_2.name)
        expect(page).to have_content(pet_2.age)
        expect(page).to have_content(pet_2.sex)

        pet_2_image = find('img')
        expect(pet_2_image[:src]).to eql(pet_2.image)
      end

      within("#shelter-pets-list-item-#{pet_3.id}") do
        expect(page).to have_content(pet_3.name)
        expect(page).to have_content(pet_3.age)
        expect(page).to have_content(pet_3.sex)

        pet_3_image = find('img')
        expect(pet_3_image[:src]).to eql(pet_3.image)
      end
    end

    expect(page).not_to have_content(pet_4.name)
  end
end
