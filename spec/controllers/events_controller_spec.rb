require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  before :each do
    @captain = FactoryBot.create(:user)
    @teammate =  FactoryBot.create(:user)
    @team = FactoryBot.create(:team, captain: @captain)
    @schedule = FactoryBot.create(:schedule, team: @team)
  end

  describe 'POST create' do
    before :each do
      time = DateTime.now + 1.week
      location = 'Ol Ball Field'
      @params = {
        event: {
          start: time,
          location: location
        },
        schedule_id: @schedule.id
      }
    end

    context 'as team captain' do
      before :each do
        sign_in @captain
      end

      it 'creates a new event' do
        expect { post(:create, params: @params) }
          .to change(Event, :count).by(1)
      end
    end

    context 'as not team captain' do
      before :each do
        sign_in @teammate
      end

      it 'does not create an event' do
        expect { post(:create, params: @params) }
          .to change(Event, :count).by(0)
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @event = FactoryBot.create(:event, schedule: @schedule)
    end

    context 'as team captain' do
      before :each do
        sign_in @captain
      end

      it 'deletes the event' do
        expect { delete(:destroy, params: { id: @event.id }) }
          .to change(Event, :count).by(-1)
      end
    end

    context 'as not team captain' do
      before :each do
        sign_in @teammate
      end
      it 'does not delete the event' do
        expect { delete(:destroy, params: { id: @event.id }) }
          .to change(Event, :count).by(0)
      end
    end
  end

end
