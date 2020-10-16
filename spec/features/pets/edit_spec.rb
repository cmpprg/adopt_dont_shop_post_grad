require 'rails_helper'

RSpec.describe 'As a user on the edit pet page' do
  it "I can update image of a pet, click 'Update Pet', and redirect to show and see change" do
    pet = create(:pet)
    old_image = pet.image
    new_image = 'https://pagebean-pagebean.netdna-ssl.com/sciplus/productImages/Regular/63830.jpg'

    visit "pets/#{pet.id}/edit"

    fill_in :image, with: new_image

    click_button('Update Pet')

    expect(page).to have_current_path("/pets/#{pet.id}")
    within('.pet-info') do
      expect(find('img')[:src]).to eql(new_image)
      expect(find('img')[:src]).not_to eql(old_image)
    end
  end

  it "I can update name and description of pet" do
    pet = create(:pet)
    old_name = pet.name
    old_description = pet.description
    new_name = 'This is a new name'
    new_description = 'This is a new description that is unecessarily long.'

    visit "pets/#{pet.id}/edit"

    fill_in :name, with: new_name
    fill_in :description, with: new_description

    click_button('Update Pet')

    expect(page).to have_current_path("/pets/#{pet.id}")
    within('.pet-info') do
      expect(page).to have_content(new_name)
      expect(page).to have_content(new_description)
      expect(page).not_to have_content(old_name)
      expect(page).not_to have_content(old_description)
    end
  end

  it "I can update age and sex of pet" do
    pet = create(:pet, age: 4, sex: 'male')
    old_age = pet.age
    old_sex = pet.sex
    new_age = 5
    new_sex = 'femal'

    visit "pets/#{pet.id}/edit"

    fill_in :age, with: new_age
    fill_in :sex, with: new_sex

    click_button('Update Pet')

    expect(page).to have_current_path("/pets/#{pet.id}")
    within('.pet-info') do
      expect(page).to have_content(new_age)
      expect(page).to have_content(new_sex)
      expect(page).not_to have_content(old_age)
      expect(page).not_to have_content(old_sex)
    end
  end
end
