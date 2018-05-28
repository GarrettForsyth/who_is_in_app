require 'rails_helper'

RSpec.describe Roster, type: :model do
  context 'wtih valid attributes' do
    it 'has a valid factory' do
      expect(FactoryBot.build(:roster)).to be_valid
    end
  end
  context 'with invalid attributes' do
    it 'is invalid without a team' do
      expect(FactoryBot.build(:roster, team: nil)).to_not be_valid
    end
  end
end
