require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  before :each do
    @captain = FactoryBot.create(:user)
    @author = FactoryBot.create(:user)
    @team = FactoryBot.create(:team, captain: @captain)
    @team.add_member(@author)
    sign_in @author
  end
  describe 'POST create' do
    before :each do
      @params = {
        message: FactoryBot.attributes_for(:message, author_id: @author.id),
        team_id: @team.id
      }
    end

    context 'with valid attributes' do
      it 'creates a new message' do
        expect { post(:create, params: @params) }.to change(Message, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'rejects blank content' do
        @params[:message][:content] = ''
        expect { post(:create, params: @params) }.to change(Message, :count).by(0)
      end

      it 'rejects a post created by a non team member' do
        sign_out @author
        @bad_user = FactoryBot.create(:user)
        sign_in @bad_user
        @params[:message][:author_id] = @bad_user.id
        expect { post(:create, params: @params) }.to change(Message, :count).by(0)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'with valid attributes' do
      it 'deletes the message when the user is the author' do
        message = FactoryBot.create(:message, author_id: @author.id, team_id: @team.id)
        expect { delete :destroy, params: { id: message.id } }
          .to change(Message, :count).by(-1)
      end

      it 'deletes the message when the user is team captain and not author' do
        sign_out @author
        sign_in @captain
        message = FactoryBot.create(:message, author_id: @author.id, team_id: @team.id)
        expect { delete :destroy, params: { id: message.id } }
          .to change(Message, :count).by(-1)
      end
    end

    context 'with invalid attributes' do
      it 'does not delete the message if the user is not author or captain' do
        message = FactoryBot.create(:message, author_id: @captain.id, team_id: @team.id)
        expect { delete :destroy, params: { id: message.id } }
          .to change(Message, :count).by(0)
      end
    end
  end
end
