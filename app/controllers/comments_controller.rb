class CommentsController < ApplicationController
  before_action only: :create do
    user = User.find_by_id(params[:comment][:author_id])
    authenticate_current_user(user)
  end
  before_action only: :destroy do
    comment = Comment.find(params[:id])
    authenticate_team_captain(comment.message.team)
  end

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
end
