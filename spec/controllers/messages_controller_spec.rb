require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  describe 'POST create' do
    before :each do
      @author = FactoryBot.create(:user)
      @team = FactoryBot.create(:team, captain: @author)
      @params = { message: {
        author_id: @author.id,
        team_id: @team.id,
        content: 'hello world!'
      } }
      sign_in @author
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
        @bad_user = FactoryBot.create(:user)
        @params[:message][:author_id] = @bad_user.id 
        expect { post(:create, params: @params) }.to change(Message, :count).by(0)
      end
    end
  end
end
