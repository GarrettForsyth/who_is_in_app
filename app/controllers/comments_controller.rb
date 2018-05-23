class CommentsController < ApplicationController
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

  private

  def comment_params
    params.require(:comment).permit(:author_id, :message_id, :content)
      .merge({ message_id: params[:message_id] })
  end
end
