class MessagesController < ApplicationController
  before_action :authorize_member, except: :new
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

  private

  def message_params
    params.require(:message).permit(:author_id, :team_id, :content)
  end

  def authorize_member
    team = Team.find(params[:message][:team_id])
    user = User.find(params[:message][:author_id])
    redirect_to team_path(team) unless team.members.include?(user)
  end
end
