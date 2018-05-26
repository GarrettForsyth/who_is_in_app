class CommentsController < ApplicationController
  before_action :authenticate_current_user, only: :create
  before_action :authenticate_captain, only: :destroy

  def new
    @message = Message.find(params[:message_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to team_path(@comment.message.team)
    else
      @message = Message.find(params[:message_id])
      render 'new'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      flash[:notice] = 'Comment deleted!'
      redirect_to team_path(comment.message.team)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author_id, :content)
      .merge({ message_id: params[:message_id] })
  end

  def authenticate_current_user
    user = User.find(params[:comment][:author_id])
    redirect_to dashboard_path unless user == current_user
  rescue ActiveRecord::RecordNotFound
    redirect_to dashboard_path
  end

  def authenticate_captain
    comment = Comment.find(params[:id])
    team = comment.message.team
    redirect_to team_path unless team.captain?(current_user)
  rescue ActiveRecord::RecordNotFound
    redirect_to team_path
  end
end
