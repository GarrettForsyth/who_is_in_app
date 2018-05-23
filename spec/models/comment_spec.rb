require 'rails_helper'
require 'rails_helper'

RSpec.describe Comment, type: :model do

  context 'with valid attributes' do
    it 'has a valid factory' do
      expect(FactoryBot.build(:comment)).to be_valid
    end
  end
  context 'with invalid attributes' do
    it 'is invalid with blank content' do
      comment = FactoryBot.build(:comment, content: '')
      expect(comment).to_not be_valid
    end

    it 'is invalid without an author' do
      comment = FactoryBot.build(:comment, author: nil)
      expect(comment).to_not be_valid
    end

    it 'is invalid without a message' do
      comment = FactoryBot.build(:comment, message: nil)
      expect(comment).to_not be_valid
    end
  end
end
