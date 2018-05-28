require 'rails_helper'

RSpec.describe Finance, type: :model do
  context 'with valid attributes' do
    it 'has a valid factroy' do
      finance = FactoryBot.build(:finance)
      expect(finance).to be_valid
    end
  end

  context 'with invalid attributes' do
    it 'is invalid without a user' do
      finance = FactoryBot.build(:finance, user: nil)
      expect(finance).to_not be_valid
    end

    it 'is invalid without a team' do
      finance = FactoryBot.build(:finance, team: nil)
      expect(finance).to_not be_valid
    end

    it 'is invalid if a duplicate' do
      finance = FactoryBot.create(:finance)
      dup_finance = FactoryBot.build(:finance,
                                     user: finance.user,
                                     team: finance.team)
      expect(dup_finance).to_not be_valid
    end
  end
end
