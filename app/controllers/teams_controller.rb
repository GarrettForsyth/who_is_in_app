class TeamsController < ApplicationController
  before_action :authenticate_captain,  except: %i[new create show remove_member]
  before_action :authenticate_member,   except: %i[new create remove_member]
  before_action :authenticate_current_user, only: :create
  before_action :authorize_remove_member, only: :remove_member

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

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
    team.remove_member(member)
    flash[:notice] = 'Member successfully removed!'
    redirect_back(fallback_location: dashboard_path)
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

  def authenticate_current_user
    user = User.find(params[:team][:user_id])
    redirect_to dashboard_path unless user == current_user
  rescue ActiveRecord::RecordNotFound
    redirect_to dashboard_path
  end

  def authenticate_captain
    team = Team.find(params[:id])
    redirect_to team_path(team) unless team.captain?(current_user)
  rescue ActiveRecord::RecordNotFound
    redirect_to team_path(team)
  end

  def authenticate_member
    team = Team.find(params[:id])
    redirect_to dashboard_path unless team.member?(current_user)
  rescue ActiveRecord::RecordNotFound
    redirect_to dashboard_path
  end

  def authorize_remove_member
    team = Team.find(params[:team_id])
    redirect_to team_path(team) unless team.captain?(current_user)
  rescue ActiveRecord::RecordNotFound
    redirect_to team_path(team)
  end
end
