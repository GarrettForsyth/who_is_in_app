class MessagesController < ApplicationController
  before_action except: %i[new destroy] do
    authenticate_team_member(Team.find_by_id(params[:team_id]))
  end
  before_action :authenticate_destroy, only: :destroy

  def new
    @team = Team.find(params[:team_id])
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = 'Message posted!'
      redirect_to team_path(@message.team)
    else
      @team = Team.find(params[:team_id])
      render 'new'
    end
  end

  def destroy
    if Message.find(params[:id]).destroy
      flash[:notice] = 'Message deleted!'
      redirect_back(fallback_location: dashboard_path)
    end
  end

  private

  def message_params
    params.require(:message).permit(:author_id, :content)
          .merge(team_id: params[:team_id])
  end

  def authenticate_destroy
    message = Message.find(params[:id])
    valid = (current_user == message.author || current_user == message.team.captain)
    redirect_to team_path(message.team) unless valid
  end
end
