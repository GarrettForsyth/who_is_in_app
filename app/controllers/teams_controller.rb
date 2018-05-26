class TeamsController < ApplicationController
  before_action :authenticate_captain,  except: %i[new create show]
  before_action :authenticate_member,   except: %i[new create]
  before_action :authenticate_current_user, only: :create

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
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
    redirect_to team_path unless team.captain?(current_user)
  rescue ActiveRecord::RecordNotFound
    redirect_to team_path
  end

  def authenticate_member
    team = Team.find(params[:id])
    redirect_to dashboard_path unless team.member?(current_user)
  rescue ActiveRecord::RecordNotFound
    redirect_to dashboard_path
  end
end
