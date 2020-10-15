require 'rails_helper'

RSpec.describe 'As a user on the shelters index page', type: :feature do
  it "I see the name of each shelter in the system" do
    shelter_1 = create(:shelter)
    shelter_2 = create(:shelter)
    shelter_3 = create(:shelter)

    visit '/shelters'

    expect(current_path).to eql('/shelters')

    within('.shelter-list') do
      within("#shelter-list-item-#{shelter_1.id}") do
        expect(page).to have_content(shelter_1.name)
      end
      within("#shelter-list-item-#{shelter_2.id}") do
        expect(page).to have_content(shelter_2.name)
      end
      within("#shelter-list-item-#{shelter_3.id}") do
        expect(page).to have_content(shelter_3.name)
      end
    end
  end

  it "I can see a link name 'New Shelter', when clicked takes me to a shelter creation page" do
    visit '/shelters'

    expect(page).to have_link('New Shelter')

    click_link('New Shelter')

    expect(current_path).to eql('/shelters/new')
  end
end
