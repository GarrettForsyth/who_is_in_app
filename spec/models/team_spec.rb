require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'validations' do
    context 'with valid attributes given' do
      it 'has a valid factory' do
        team = FactoryBot.build(:team)
        expect(team).to be_valid
      end
    end
    context 'with invalid attributes given' do
      it 'is invalid without a name' do
        team = FactoryBot.build(:team, name: '')
        expect(team).to_not be_valid
      end

      it 'is invalid with a blank name' do
        team = FactoryBot.build(:team, name: '      ')
        expect(team).to_not be_valid
      end

      it 'is invalid with an unrecognized activity' do
        expect(Activity.find_by(name: 'Shirtless Ice Fishing')).to be_nil
        shirtless_ice_fishing = Activity.new(name: 'shirtless icefishing')
        team = FactoryBot.build(:team, activity: shirtless_ice_fishing)
        expect(team).to_not be_valid
      end

      it 'is invalid with an activity id that is less than 1' do
        team = FactoryBot.build(:team, activity_id: 0)
        expect(team).to_not be_valid
      end

      it 'is invalid with an activity id that doesn\'t exist' do
        bad_id = Activity.all.last.id + 1 || 1
        team = FactoryBot.build(:team, activity_id: bad_id )
        expect(team).to_not be_valid
      end

      it 'is invalid without a minimum member threshold' do
        team = FactoryBot.build(:team, min_members: nil) 
        expect(team).to_not be_valid
      end

      it 'is invalid with a minmum member threshold less than 1' do
        team = FactoryBot.build(:team, min_members: 0)
        expect(team).to_not be_valid
      end

      it 'is invalid without a captain' do
        team = FactoryBot.build(:team, captain: nil)
        expect(team).to_not be_valid
      end
    end
  end
end
