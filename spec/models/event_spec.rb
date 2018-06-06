require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'with valid attributes' do
    it 'has a valid factory' do
      event = FactoryBot.build(:event)
      expect(event).to be_valid
    end

    it 'is valid without a location' do
      event = FactoryBot.build(:event, location: nil)
      expect(event).to be_valid
    end
  end

  context 'with invalid attributes' do
    it 'is invalid without a schedule' do
      event = FactoryBot.build(:event, schedule: nil)
      expect(event).to_not be_valid
    end

    it 'is invalid without a start' do
      event = FactoryBot.build(:event, start: nil)
      expect(event).to_not be_valid
    end
  end
end
