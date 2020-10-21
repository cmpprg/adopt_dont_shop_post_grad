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

  it "I can click edit shelter link, that takes me to edit shelter page, that is located with every shelter." do
    shelter_1 = create(:shelter)
    shelter_2 = create(:shelter)
    shelter_3 = create(:shelter)

    visit '/shelters'

    within("#shelter-list-item-#{shelter_1.id}") do
      expect(page).to have_link('Edit Shelter')
    end

    within("#shelter-list-item-#{shelter_2.id}") do
      expect(page).to have_link('Edit Shelter')
    end

    within("#shelter-list-item-#{shelter_3.id}") do
      click_link('Edit Shelter')
    end

    expect(page).to have_current_path("/shelters/#{shelter_3.id}/edit")
  end

  it "I can see and click a link to delete shelter next to every shelter on page." do
    shelter_1 = create(:shelter)
    shelter_2 = create(:shelter)
    shelter_3 = create(:shelter)

    visit '/shelters'

    within("#shelter-list-item-#{shelter_1.id}") do
      expect(page).to have_link('Delete Shelter')
    end

    within("#shelter-list-item-#{shelter_3.id}") do
      expect(page).to have_link('Delete Shelter')
    end

    within("#shelter-list-item-#{shelter_2.id}") do
      click_link('Delete Shelter')
    end

    expect(page).to have_current_path('/shelters')
    expect(page).to have_no_css("#shelter-list-item-#{shelter_2.id}")
    expect(Shelter.exists?(shelter_2.id)).to eql(false)
  end
end
