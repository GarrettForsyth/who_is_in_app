class TeamsController < ApplicationController
  before_action :authenticate_captain,  except: [:new, :create, :show]
  before_action :authenticate_member,   except: [:new, :create]
  def new
    @team = Team.new
  end

  def create
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

  private

  def team_params
    params.require(:team).permit(:name, :activity_id, :min_members, :user_id, :schedule)
  end

  def authenticate_captain
    if Team.find(params[:id]).captain.id != current_user.id
      redirect_to dashboard_path
    end
  end

  def authenticate_member
    unless Team.find(params[:id]).members.include?(current_user)
      redirect_to dashboard_path
    end
  end
end
