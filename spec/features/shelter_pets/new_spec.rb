require 'rails_helper'

RSpec.describe 'As a user on the new shelter pets page' do
  it "I can fill out a form and create a new pet for a shelter" do
    shelter = create(:shelter)

    visit "/shelters/#{shelter.id}/pets/new"

    fill_in :image, with: 'Image URL'
    fill_in :name, with: 'New Pet Name'
    fill_in :description, with: 'This is a description of the new pet'
    fill_in :age, with: 5
    fill_in :sex, with: 'female'

    click_button('Create Pet')

    new_pet = shelter.pets.last

    expect(page).to have_current_path("/shelters/#{shelter.id}/pets")
    expect(new_pet.adoption_status).to eql('adoptable')
    expect(new_pet.descriptoin).to eql('This is a description of the new pet')

    within("shelter-pets-list-item-#{new_pet.id}") do
      expect(page).to have_content(new_pet.name)
      expect(page).to have_content(new_pet.age)
      expect(page).to have_content(new_pet.sex)
      expect(find('img')[:src]).to have_content(new_pet.image)
    end
  end
end
