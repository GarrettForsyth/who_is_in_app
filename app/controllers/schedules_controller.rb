class SchedulesController < ApplicationController
  def new
    @team = Team.find(params[:team_id])
    @schedule = Schedule.new
  end

  def create
    @team = Team.find(params[:team_id])
    @schedule = @team.build_schedule(schedule_params)
    if @schedule.save
      flash[:notice] = 'Schedule successfully created.'
      redirect_to team_path(@schedule.team)
    else
      flash.now[:notice] = 'Could not create schedule.'
      render :new
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:image)
  end

end
