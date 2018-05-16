class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    puts params
    @team = Team.new(team_params)

    if @team.save
      current_user.teams << @team
      @team.members << current_user

      flash[:notice] = 'Team successfully created!'
      redirect_to @team
    else
      render :new
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  private

  def team_params
    params.require(:team).permit(:name, :activity_id, :min_members)
  end
end
