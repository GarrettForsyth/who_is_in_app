require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before :each do
    @captain = FactoryBot.create(:user)
    @author = FactoryBot.create(:user)
    @team = FactoryBot.create(:team, captain: @captain)
    @message = FactoryBot.create(:message, author_id: @captain.id, team_id: @team.id)
    sign_in @author
  end
  describe 'POST #create' do
    context 'wtih valid attributes' do
      it 'creates a new comment' do
        params = {
          comment: FactoryBot.attributes_for(:comment, author_id: @author.id),
          message_id: @message.id
        }
        expect { post :create, params: params }
          .to change(Comment, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not craete a new comment with blank content' do
        params = {
          comment: FactoryBot.attributes_for(:comment, author_id: @author.id, content: ''),
          message_id: @message.id
        }
        expect { post :create, params: params }
          .to change(Comment, :count).by(0)
      end

      it 'does not create a new comment when the current user isn\'t the author' do
        params = {
          comment: FactoryBot.attributes_for(:comment, author_id: @captain.id),
          message_id: @message.id
        }
        expect { post :create, params: params }
          .to change(Comment, :count).by(0)
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @comment = FactoryBot.create(:comment, message_id: @message.id, author_id: @author.id)
    end
    context 'with valid attributes' do
      it 'deletes the comment' do
        sign_out @author
        sign_in @captain
        expect { delete :destroy, params: { id: @comment.id } }
          .to change(Comment, :count).by(-1)
      end
    end

    context 'with invalid attributes' do
      it 'does not let someone who isn\'t captain delete a comment' do
        expect { delete :destroy, params: { id: @comment.id } }
          .to change(Comment, :count).by(0)
      end
    end
  end
end
