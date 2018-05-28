require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
  # Note: The user must be signed in to be authenticated by the controller
  before :each do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      before :each do
        @params = { team: FactoryBot.attributes_for(:team, user_id: @user) }
      end

      it 'creates a team' do
        expect { post(:create, params: @params) }
          .to change(Team, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      before :each do
        @params = { team: FactoryBot.attributes_for(:team, user_id: nil) }
      end

      it 'does not create a team without a captain' do
        expect { post(:create, params: @params) }
          .to change(Team, :count).by(0)
      end

      it 'cannot create teams with someone else as captain' do
        @someone = FactoryBot.create(:user)
        @params = { team: FactoryBot.attributes_for(:team, user_id: @someone) }
        expect { post(:create, params: @params) }
          .to change(Team, :count).by(0)
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @team = FactoryBot.create(:team, captain: @user)
    end

    context 'with valid parameters' do
      it 'updates the attribute' do
        params = { id: @team.id, team: { name: 'new name' } }
        put :update, params: params
        @team.reload
        expect(@team).to have_attributes(name: 'new name')
      end
    end

    context 'with invalid attriutes' do
      it 'does not update the model' do
        params = { id: @team.id, team: { name: '' } }
        put :update, params: params
        name = @team.name
        @team.reload
        expect(@team).to have_attributes(name: name)
      end
    end
  end

  describe 'PATCH remove_member' do
    before :each do
      @team = FactoryBot.create(:team, captain: @user)
      @teammate = FactoryBot.create(:user)
      @team.add_member(@teammate)
    end
    context 'wtih valid attributes' do
      it 'removes a member from the team' do
        expect { patch :remove_member, params: { id: @teammate.id, team_id: @team.id } }
          .to change(@team.members, :count).by(-1)
      end
    end
    context 'wtih invalid attributes' do
      before :each do
        @team = FactoryBot.create(:team, captain: @user)
        @teammate = FactoryBot.create(:user)
        @team.add_member(@teammate)
        sign_out @user
        sign_in @teammate
      end
      it 'does not removes a member from the team' do
        expect { patch :remove_member, params: { id: @teammate.id, team_id: @team.id } }
          .to change(@team.members, :count).by(0)
      end
    end
  end

  describe 'DELETE destroy' do
    context 'with valid attributes' do
      it 'deletes the team' do
        @team = FactoryBot.create(:team, captain: @user)
        expect { delete :destroy, params: { id: @team.id } }
          .to change(Team, :count).by(-1)
      end
    end
    context 'with invalid attributes' do
      it 'does not delete the team if the current user is not the captain' do
        @not_my_team = FactoryBot.create(:team)
        expect { delete :destroy, params: { id: @not_my_team.id } }
          .to change(Team, :count).by(0)
      end
    end
  end
end
