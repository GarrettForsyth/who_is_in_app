require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe 'validations' do
    context 'with valid attributes give' do
      it 'has a valid factory' do
        actvity = FactoryBot.build(:activity)
        expect(actvity).to be_valid
      end
    end

    context 'with invalid properties' do
      it 'is invalid without a name' do
        activity = FactoryBot.build(:activity, name: '')
        expect(activity).to_not be_valid
      end
       
      it 'is invalid with a duplicate name' do
        FactoryBot.create(:activity, name: 'Movie Night')
        activity = FactoryBot.build(:activity, name: 'Movie Night')
        expect(activity).to_not be_valid
      end
    end
  end
end
