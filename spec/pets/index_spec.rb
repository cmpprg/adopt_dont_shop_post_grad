require 'rails_helper'

RSpec.describe 'As a user on the pets index page', type: :feature do
  it "I can see list of all pets including image, name, approximate age, sex, shelter name" do
    shelter_1 = create(:shelter)
    shelter_2 = create(:shelter)

    pet_1 = create(:pet, shelter: shelter_1)
    pet_2 = create(:pet, shelter: shelter_1)
    pet_3 = create(:pet, shelter: shelter_2)

    visit '/pets'

    within('.pets-list') do
      within("#pets-list-item-#{pet_1.id}") do
        expect(page).to have_content(pet_1.name)
        expect(page).to have_content(pet_1.age)
        expect(page).to have_content(pet_1.sex)
        expect(page).to have_content(shelter_1.name)

        pet_1_image = find('img')
        expect(pet_1_image[:src]).to eql(pet_1.image)
      end

      within("#pets-list-item-#{pet_2.id}") do
        expect(page).to have_content(pet_2.name)
        expect(page).to have_content(pet_2.age)
        expect(page).to have_content(pet_2.sex)
        expect(page).to have_content(shelter_1.name)

        pet_2_image = find('img')
        expect(pet_2_image[:src]).to eql(pet_2.image)
      end

      within("#pets-list-item-#{pet_3.id}") do
        expect(page).to have_content(pet_3.name)
        expect(page).to have_content(pet_3.age)
        expect(page).to have_content(pet_3.sex)
        expect(page).to have_content(shelter_2.name)

        pet_3_image = find('img')
        expect(pet_3_image[:src]).to eql(pet_3.image)
      end
    end
  end

end
