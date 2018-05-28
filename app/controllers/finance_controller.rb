class FinanceController < ApplicationController
  before_action :authenticate_captain, only: :update
  def update
    finance = Finance.find(params[:id])
    finance.paid = !finance.paid
    finance.save
    redirect_back(fallback_location: dashboard_path)
  end

  private 

  def authenticate_captain
    team = Finance.find(params[:id]).team
    redirect_to dashboard_path unless team.captain?(current_user) 
  end
end
