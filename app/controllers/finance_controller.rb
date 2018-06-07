class FinanceController < ApplicationController
  before_action only: :update do
    team = Finance.find_by_id(params[:id]).team
    authenticate_team_captain(team)
  end
  def update
    finance = Finance.find(params[:id])
    finance.paid = !finance.paid
    finance.save
    redirect_back(fallback_location: dashboard_path)
  end
end
