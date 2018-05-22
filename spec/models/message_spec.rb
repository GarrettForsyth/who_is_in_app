require 'rails_helper'

RSpec.describe Message, type: :model do

  context 'with valid attributes' do
    it 'has a valid factory' do
      expect(FactoryBot.build(:message)).to be_valid
    end
  end
  context 'with invalid attributes' do
    it 'is invalid with blank content' do
      message = FactoryBot.build(:message, content: '')
      expect(message).to_not be_valid
    end

    it 'is invalid without an author' do
      message = FactoryBot.build(:message, author: nil)
      expect(message).to_not be_valid
    end

    it 'is invalid without a team' do
      message = FactoryBot.build(:message, team: nil)
      expect(message).to_not be_valid
    end
  end
end
