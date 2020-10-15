require 'rails_helper'

RSpec.describe 'As a user on the edit shelter page', type: :feature do
  before do
    @shelter = Shelter.create(
      name: 'Shelter 1',
      address: 'Address 1',
      city: 'City 1',
      state: 'State 1',
      zip: '12345'
    )
  end

  it "I can see name, address, city, state, or zip fields to enter new info into." do

    visit "/shelters/#{@shelter.id}/edit"

    expect(page).to have_field(:name)
    expect(page).to have_field(:address)
    expect(page).to have_field(:city)
    expect(page).to have_field(:state)
    expect(page).to have_field(:zip)
  end

  it "I can edit shelter name, click 'Update Shelter', be redirected to show page and see change." do
    visit "/shelters/#{@shelter.id}/edit"

    fill_in :name, with: "other shelter name"

    click_button("Update Shelter")

    expect(page).to have_current_path("/shelters/#{@shelter.id}")
    expect(page).not_to have_content('Shelter 1')
    expect(page).to have_content('other shelter name')
  end

  it "I can edit shelter address" do
    visit "/shelters/#{@shelter.id}/edit"

    fill_in :address, with: "other shelter address"

    click_button("Update Shelter")

    expect(page).not_to have_content('Address 1')
    expect(page).to have_content('other shelter address')
  end

  it "I can edit shelter city" do
    visit "/shelters/#{@shelter.id}/edit"

    fill_in :city, with: "other shelter city"

    click_button("Update Shelter")

    expect(page).not_to have_content('City 1')
    expect(page).to have_content('other shelter city')
  end

  it "I can edit shelter state" do
    visit "/shelters/#{@shelter.id}/edit"

    fill_in :state, with: "other shelter state"

    click_button("Update Shelter")

    expect(page).not_to have_content('State 1')
    expect(page).to have_content('other shelter state')
  end

  it "I can edit shelter zip" do
    visit "/shelters/#{@shelter.id}/edit"

    fill_in :zip, with: "other shelter zip"

    click_button("Update Shelter")

    expect(page).not_to have_content('Zip 1')
    expect(page).to have_content('other shelter zip')
  end
end
