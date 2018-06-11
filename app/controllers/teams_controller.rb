class TeamsController < ApplicationController
  before_action except: %i[new create show remove_member] do
    authenticate_team_captain(Team.find_by_id(params[:id]))
  end
  before_action except: %i[new create remove_member] do
    authenticate_team_member(Team.find_by_id(params[:id]))
  end
  before_action only: :create do
    authenticate_current_user(User.find_by_id(params[:team][:user_id]))
  end
  before_action only: :remove_member do
    authenticate_team_captain(Team.find_by_id(params[:team_id]))
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.schedule = Schedule.new

    if @team.save
      @team.add_member(current_user)
      @team.create_roster
      flash[:notice] = 'Team successfully created!'
      redirect_to @team
    else
      render :new
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(team_params)
      flash[:notice] = 'Team information has been updated!'
      redirect_to @team
    else
      render 'edit'
    end
  end

  def remove_member
    team = Team.find(params[:team_id])
    member = User.find(params[:id])
    unless team.captain?(member)
      team.remove_member(member)
      flash[:notice] = 'Member successfully removed!'
      redirect_back(fallback_location: dashboard_path)
    else
      flash[:notice] = 'You cannot remove yourself!'
      redirect_back(fallback_location: team_roster_path(team.id))
    end 
  end

  def destroy
    team = Team.find(params[:id])
    if team.destroy
      flash[:notice] = 'Team deleted!'
      redirect_to dashboard_path
    else
      flash[:error] = 'Team could not be destroyed!'
      render 'edit'
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :activity_id,
                                 :minimum_members_needed_for_an_event,
                                 :user_id, :schedule)
  end
end
