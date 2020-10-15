require 'rails_helper'

RSpec.describe 'As a user on the shelter show page', type: :feature do
  before do
    @shelter_1 = create(:shelter)
    @shelter_2 = create(:shelter)
    @shelter_3 = create(:shelter)
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

  it "I can click a link 'Update Shelter' that takes me to form to update info" do
    visit "/shelters/#{@shelter_2.id}"

    click_link('Edit Shelter')

    expect(page).to have_current_path("/shelters/#{@shelter_2.id}/edit")
  end

  it "I can click a link 'Delete Shelter' that deletes the record and redirects to shelter index page" do
    visit "/shelters/#{@shelter_2.id}"

    click_link('Delete Shelter')

    expect(page).to have_current_path('/shelters')

    expect(page).not_to have_content(@shelter_2.name)
    expect(Shelter.exists?(@shelter_2.id)).to eql(false)
  end
end
