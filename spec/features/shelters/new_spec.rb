require 'rails_helper'

RSpec.describe 'As a user on the new shelter form page' do
  it "I can fill out name, address, city, state, and zip, click Create Shelter, and be taken to index where new shelter is displayed" do
    visit '/shelters/new'

    fill_in('name', with: 'new shelter name')
    fill_in('address', with: 'new shelter address')
    fill_in('city', with: 'new shelter city')
    fill_in('state', with: 'new shelter state')
    fill_in('zip', with: 'new shelter zip')

    click_on('Create Shelter')

    expect(page).to have_current_path('/shelters')

    within('.shelter-list') do

      expect(page).to have_content('new shelter name')
    end
  end
end
