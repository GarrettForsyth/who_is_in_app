class InvitationsController < ApplicationController
  def new
    @team = Team.find(params[:team_id])
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    if @invitation.save
      flash[:notice] = 'Team invite sent!'
      redirect_back(fallback_location: dashboard_path)
    else  
      @team = Team.find(params[:team_id])
      render 'new'
    end
  end

  def update
    @invitation = Invitation.find(params[:id])
    @invitation.accept
  end

  def destroy

  end

  private

  def invitation_params
    params.require(:invitation).permit(:invite_email, :from_id)
      .merge( { team_id: params[:team_id] } )
  end

end
