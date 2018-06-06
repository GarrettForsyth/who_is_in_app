class EventsController < ApplicationController
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

  private

  def event_params
    params.require(:event).permit(:start, :location)
  end

end
