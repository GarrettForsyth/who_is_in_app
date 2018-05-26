require 'rails_helper'

RSpec.describe Invitation, type: :model do
  context 'with valid attributes' do
    it 'has a valid factory' do
      invitation = FactoryBot.build(:invitation)
      expect(invitation).to be_valid
    end
  end

  context 'with invalid attributes' do
    it 'is invalid without a recipient' do
      invitation = FactoryBot.build(:invitation, to: nil)
      expect(invitation).to_not be_valid
    end

    it 'is invalid without a sender' do
      invitation = FactoryBot.build(:invitation)
      invitation.from = nil
      expect(invitation).to_not be_valid
    end

    it 'is invalid without a team' do
      invitation = FactoryBot.build(:invitation, team: nil)
      expect(invitation).to_not be_valid
    end

    it 'is invalid if the recipient is already on the  team' do
      user = FactoryBot.create(:user)
      team = FactoryBot.create(:team, captain: user)
      invitation = FactoryBot.build(:invitation, to: user, team: team)
      expect(invitation).to_not be_valid
    end

    it 'is invalid if the invitation has already been sent' do
      captain = FactoryBot.create(:user)
      user = FactoryBot.create(:user)
      team = FactoryBot.create(:team, captain: captain)
      FactoryBot.create(:invitation, from: captain, to: user, team: team)
      invitation = FactoryBot.build(:invitation, from: captain, to: user, team: team)
      expect(invitation).to_not be_valid
    end

    it 'is invalid if the sender is not the team captain' do
      captain = FactoryBot.create(:user)
      user = FactoryBot.create(:user)
      team = FactoryBot.create(:team, captain: captain)
      invitation = FactoryBot.build(:invitation, team: team)
      invitation.from = user
      expect(invitation).to_not be_valid
    end
  end
end
