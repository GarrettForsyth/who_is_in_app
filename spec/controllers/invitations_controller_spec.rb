require 'rails_helper'

RSpec.describe InvitationsController, type: :controller do
  before :each do
    @user = FactoryBot.create(:user)
    @captain = FactoryBot.create(:user)
    @team = FactoryBot.create(:team, captain: @captain)
    sign_in @captain
  end
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new Invitation' do
        params = {
          invitation: {
            to_id: @user.id,
            from_id: @captain.id
          },
          team_id: @team.id
        }
        expect { post :create, params: params }
          .to change(Invitation, :count).by(1)
      end
    end

    context 'with invalid paramters' do
      it 'does not create an invitation' do
        params = {
          invitation: {
            to_id: @captain.id,
            from_id: @captain.id
          },
          team_id: @team.id
        }
        expect { post :create, params: params }
          .to change(Invitation, :count).by(0)
      end

      it 'does not send if the current user is not the captain' do
        sign_out @captain
        sign_in @user
        params = {
          invitation: {
            to_id: @user.id,
            from_id: @captain.id
          },
          team_id: @team.id
        }
        expect { post :create, params: params }
          .to change(Invitation, :count).by(0)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      before :each do
        @invitation = FactoryBot.create(:invitation,
                                       to: @user,
                                       from: @captain,
                                       team: @team)
        sign_out @captain
        sign_in @user
      end
      it 'adds the user to the team' do
        put :update, params: { id: @invitation.id }
        @user.reload
        expect(@user.teams).to include(@team)
      end

      it 'deletes the invitation' do
        expect {
        put :update, params: { id: @invitation.id }
        }.to change(Invitation, :count).by(-1)
      end

      context 'with invalid attributes' do
        it 'can only be accepted by the current user' do
          sign_out @user
          sign_in @captain
          put :update, params: { id: @invitation.id }
          @user.reload
          expect(@user.teams).to_not include(@team)
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'with valid attributes' do
      before :each do
        @invitation = FactoryBot.create(:invitation,
                                       to: @user,
                                       from: @captain,
                                       team: @team)
        sign_out @captain
        sign_in @user
      end
      it 'it does not the user to the team' do
        put :destroy, params: { id: @invitation.id }
        @user.reload
        expect(@user.teams).to_not include(@team)
      end

      it 'deletes the invitation' do
        expect {
        put :destroy, params: { id: @invitation.id }
        }.to change(Invitation, :count).by(-1)
      end

      context 'with invalid attributes' do
        it 'can only be accepted by the current user' do
          sign_out @user
          sign_in @captain
          put :destroy, params: { id: @invitation.id }
          @user.reload
          expect(@user.teams).to_not include(@team)
        end
      end
    end
  end
end
