require 'rails_helper'

RSpec.describe SchedulesController, type: :controller do
  before :each do
    @captain = FactoryBot.create(:user)
    @teammate = FactoryBot.create(:user)
    @team = FactoryBot.create(:team, captain: @captain)
  end

  describe 'POST #create' do
    before :each do
      @params = {
        schedule: {
          image: 'path/to/image'
        },
        team_id: @team.id
      }
    end
    context 'a valid schedule' do
      context 'as team captain' do
        before :each do
          sign_in @captain
        end
        it 'creates a new schedule' do
          expect { post(:create, params: @params) }
            .to change(Schedule, :count).by(1)
        end
      end
    end
    context 'a invalid schedule' do
      context 'as not team captain' do
        before :each do
          sign_in @teammate
        end
        it 'does not create a schedule' do
          expect { post(:create, params: @params) }
            .to change(Schedule, :count).by(0)
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @schedule = FactoryBot.create(:schedule, team: @team)
    end
    context 'a valid destroy ' do
      context 'as team captain' do
        before :each do
          sign_in @captain
        end
        it 'destroys the schedule' do
          expect { delete(:destroy, params: { id: @schedule.id }) }
            .to change(Schedule, :count).by(-1)
        end
      end
    end
    context 'a invalid destroy' do
      context 'as not team captain' do
        before :each do
          sign_in @teammate
        end
        it 'does not destroy the schedule' do
          expect { delete(:destroy, params: { id: @schedule.id }) }
            .to change(Schedule, :count).by(0)
        end
      end
    end
  end
end
