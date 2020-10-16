require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :image }
    it { should validate_presence_of :age }
    it { should validate_presence_of :sex }
    it { should validate_presence_of :description }
    it { should validate_presence_of :adoption_status }
    it { should validate_inclusion_of(:adoption_status).in_array(['adoptable', 'pending']) }
  end

  describe 'relationships' do
    it { should belong_to :shelter }
  end

  describe 'instance methods' do
    before do
      @pet_1 = FactoryBot.create(:pet, adoption_status: 'adoptable')
      @pet_2 = FactoryBot.create(:pet, adoption_status: 'pending')
    end

    it "is adoptable" do
      expect(@pet_1.is_adoptable?).to eql(true)
      expect(@pet_2.is_adoptable?).to eql(false)
    end
  end
end
