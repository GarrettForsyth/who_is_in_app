class MessagesController < ApplicationController
  before_action :authorize_member, except: [:new, :destroy]
  before_action :authorize_destroy, only: :destroy
  def new
    @team = Team.find(params[:team])
    @message = Message.new
  end

  def create
    @team = Team.find(params[:message][:team_id])
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = 'Message posted!'
      redirect_to team_path(@message.team)
    else
      render 'new'
    end
  end

  def destroy
    if Message.find(params[:id]).destroy
      flash[:notice] = "Message deleted!"
      redirect_back(fallback_location: dashboard_path)
    end
  end

  private

  def message_params
    params.require(:message).permit(:author_id, :team_id, :content)
  end

  def authorize_member
    team = Team.find(params[:message][:team_id])
    user = User.find(params[:message][:author_id])
    redirect_to team_path(team) unless team.members.include?(user)
  end

  def authorize_destroy
  end
end
