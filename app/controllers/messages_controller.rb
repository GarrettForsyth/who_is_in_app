class MessagesController < ApplicationController
  def new
    @team = Team.find(params[:team])
    @message = Message.new
  end

  def create
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
end
