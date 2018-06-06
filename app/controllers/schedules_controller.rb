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

  def destroy
    @schedule = Schedule.find(params[:id])
    if @schedule.destroy 
      flash[:notice] = 'Schedule deleted.'
      redirect_to team_path(@schedule.team)
    else
      flash[:notice] = 'Schedule could not be deleted'
      render 'edit'
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:image)
  end

end
