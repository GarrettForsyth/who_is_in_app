class RostersController < ApplicationController
  before_action :authenticate_member, only: :show
  def show
    @roster = Roster.find_by(team: params[:team_id])
  end

  private

  def authenticate_member
    team = Team.find(params[:team_id])
    redirect_to dashboard_path unless team.member?(current_user)
  rescue ActiveRecord::RecordNotFound
    redirect_to dashboard_path
  end

end


