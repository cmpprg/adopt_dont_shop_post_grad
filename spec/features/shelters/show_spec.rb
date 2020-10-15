require 'rails_helper'

RSpec.describe 'As a user on the shelter show page', type: :feature do
  before do
    @shelter_1 = Shelter.create(
      name: 'Shelter 1',
      address: 'Address 1',
      city: 'City 1',
      state: 'State 1',
      zip: '12345'
    )
    @shelter_2 = Shelter.create(
      name: 'Shelter 2',
      address: 'Address 2',
      city: 'City 2',
      state: 'State 2',
      zip: '12345'
    )
    @shelter_3 = Shelter.create(
      name: 'Shelter 3',
      address: 'Address 3',
      city: 'City 3',
      state: 'State 3',
      zip: '12345'
    )
  end
  it "I see the shelter with that id including the shelters name, address, city, state, and zip" do
    visit "/shelters/#{@shelter_2.id}"

    within('.shelter-info') do
      expect(page).to have_content(@shelter_2.name)
      expect(page).to have_content(@shelter_2.address)
      expect(page).to have_content(@shelter_2.city)
      expect(page).to have_content(@shelter_2.state)
      expect(page).to have_content(@shelter_2.zip)
    end
  end

  it "I can click a link called 'Update Shelter' that takes me to form to update info" do
    visit "/shelters/#{@shelter_2.id}"

    expect(page).to have_link('Edit Shelter')

    click_link('Edit Shelter')

    expect(page).to have_current_path("/shelters/#{@shelter_2.id}/edit")
  end
end
