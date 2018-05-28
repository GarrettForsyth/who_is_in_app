require 'rails_helper'

RSpec.describe FinanceController, type: :controller do
  describe "POST #update" do
    context 'with valid attributes' do
      before :each do
        @user = FactoryBot.create(:user)
        @team = FactoryBot.create(:team, captain: @user)
        @teammate = FactoryBot.create(:user)
        @team.add_member(@teammate)
        sign_in @user
      end
      context 'teammate status is currently paid' do
        it 'changes the teammates status from paid to unpaid' do
          finance = @teammate.finance_for(@team)
          expect(finance.paid).to eq(false)
          patch :update, params: { id: finance.id }
          finance.reload
          expect(finance.paid).to eq(true)
        end
      end
      context 'teammates status is currently not paid' do
        before :each do
          f = @teammate.finance_for(@team)
          f.paid = true
          f.save
        end
        it 'changes the teammates status from paid to unpaid' do
          finance = @teammate.finance_for(@team)
          expect(finance.paid).to eq(true)
          patch :update, params: { id: finance.id }
          finance.reload
          expect(finance.paid).to eq(false)
        end
      end

      context 'with invalid attributes' do
      before :each do
        @user = FactoryBot.create(:user)
        @team = FactoryBot.create(:team, captain: @user)
        @teammate = FactoryBot.create(:user)
        @team.add_member(@teammate)
        sign_in @teammate
      end
        it 'does not update if the current user is not the team\'s  captain' do
          finance = @teammate.finance_for(@team)
          expect(finance.paid).to eq(false)
          patch :update, params: { id: finance.id }
          finance.reload
          expect(finance.paid).to eq(false)
        end
      end
    end
  end
end
