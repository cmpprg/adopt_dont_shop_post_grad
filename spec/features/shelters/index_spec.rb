require 'rails_helper'

RSpec.describe 'As a user on the shelters index page', type: :feature do
  it "I see the name of each shelter in the system" do
    shelter_1 = Shelter.create(
      name: 'Shelter 1',
      address: 'Address 1',
      city: 'City 1',
      state: 'State 1',
      zip: '12345'
    )

    shelter_2 = Shelter.create(
      name: 'Shelter 2',
      address: 'Address 2',
      city: 'City 2',
      state: 'State 2',
      zip: '12345'
    )
    shelter_3 = Shelter.create(
      name: 'Shelter 3',
      address: 'Address 3',
      city: 'City 3',
      state: 'State 3',
      zip: '12345'
    )

    visit '/'

    expect(current_path).to eql('/')

    within('.shelter-list') do
      within(".shelter-list-item-#{shelter_1.id}") do
        expect(page).to have_content(shelter_1.name)
      end
      within(".shelter-list-item-#{shelter_2.id}") do
        expect(page).to have_content(shelter_2.name)
      end
      within(".shelter-list-item-#{shelter_3.id}") do
        expect(page).to have_content(shelter_3.name)
      end
    end
  end
end
