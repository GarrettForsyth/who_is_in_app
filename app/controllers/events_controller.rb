class EventsController < ApplicationController
  before_action except: :destroy do
    schedule = Schedule.find(params[:schedule_id])
    authenticate_team_captain(schedule.team)
  end
  before_action only: :destroy do
    authenticate_team_captain(Event.find(params[:id]).schedule.team)
  end

  def new
    @schedule = Schedule.find(params[:schedule_id])
    @event = Event.new
  end

  def create
    @schedule = Schedule.find(params[:schedule_id])
    @event = Event.new(event_params.merge( { schedule: @schedule } ))

    if @event.save
      flash[:notice] = 'Event successfully created.'
      redirect_back(fallback_location: team_path(@schedule.team))
    else
      flash.now[:notice] = 'Event could not be created.'
      render :new
    end
  end

  def destroy
    event = Event.find(params[:id])
    if event.destroy
      flash[:notice] = 'Event deleted.'
    else
      flash[:notice] = 'Event could not be deleted.'
    end
    redirect_back(fallback_location: dashboard_path)
  end

  private

  def event_params
    params.require(:event).permit(:start, :location)
  end

end
