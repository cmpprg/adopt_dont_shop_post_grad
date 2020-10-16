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

    within('.pet-info') do
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

  it "I can click link 'Edit Pet' and be taken to form" do
    pet = create(:pet)

    visit "/pets/#{pet.id}"

    click_link('Edit Pet')

    expect(page).to have_current_path("/pets/#{pet.id}/edit")
  end

  it "I can click link 'Delete Pet' and expect it to delete the resource from the app" do
    pet_1 = create(:pet)
    pet_2 = create(:pet)
    pet_3 = create(:pet)

    visit "/pets/#{pet_2.id}"

    click_link('Delete Pet')

    expect(page).to have_current_path('/pets')
    expect(Pet.exists?(pet_2.id)).to eql(false)

    expect(page).to have_content(pet_1.name)
    expect(page).to have_no_content(pet_2.name)
    expect(page).to have_content(pet_3.name)
  end

end
