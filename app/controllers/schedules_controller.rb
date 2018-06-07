class SchedulesController < ApplicationController
  before_action only: :create do
    authenticate_team_captain(Team.find_by_id(params[:team_id]))
  end
  before_action only: :destroy do
    authenticate_team_captain(Schedule.find_by_id(params[:id]).team)
  end

  def new
    @team = Team.find(params[:team_id])
    @schedule = Schedule.new
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update_attributes(schedule_params)
      flash[:notice] = 'Schedule successfully updated.'
      redirect_to team_path(@schedule.team)
    else
      flash.now[:notice] = 'Schedule could not be updated.'
      render :new
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:image)
  end

end
