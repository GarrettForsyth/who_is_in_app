class RostersController < ApplicationController
  before_action only: :show do
    authenticate_team_member(Roster.find_by(team: params[:team_id]).team)
  end

  def show
    @roster = Roster.find_by(team: params[:team_id])
  end
end


