require 'rails_helper'

RSpec.describe 'As a user on the pet show page' do
  it "I can see the pet image, name, description, age, sex, and adoption status" do
    pet_1 = create(:pet)
    pet_2 = create(:pet, adoption_status: 'pending')

    visit "/pets/#{pet_1.id}"

    within('.pet-info') do
      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_1.description)
      expect(page).to have_content(pet_1.age)
      expect(page).to have_content(pet_1.sex)
      expect(page).to have_content(pet_1.adoption_status)
      expect(find('img')[:src]).to eql(pet_1.image)

      expect(page).not_to have_content(pet_2.name)
      expect(page).not_to have_content(pet_2.description)
      expect(page).not_to have_content(pet_2.adoption_status)
    end

    visit "/pets/#{pet_2.id}"

    within('.pet_info') do
      expect(page).to have_content(pet_2.name)
      expect(page).to have_content(pet_2.description)
      expect(page).to have_content(pet_2.age)
      expect(page).to have_content(pet_2.sex)
      expect(page).to have_content(pet_2.adoption_status)
      expect(find('img')[:src]).to eql(pet_2.image)

      expect(page).not_to have_content(pet_1.name)
      expect(page).not_to have_content(pet_1.description)
      expect(page).not_to have_content(pet_1.adoption_status)
    end
  end

end
