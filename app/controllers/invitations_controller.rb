class InvitationsController < ApplicationController
  before_action only: :create do
    user = User.find_by_id(params[:invitation][:from_id])
    authenticate_current_user(user)
  end
  before_action :authenticate_recipient, only: :update
  def new
    @team = Team.find(params[:team_id])
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    @team = Team.find(params[:team_id])
    if @invitation.save
      flash[:notice] = 'Invitation sent!'
      redirect_to @team
    else
      @team = Team.find(params[:team_id])
      render 'new'
    end
  end

  def update
    invitation = Invitation.find(params[:id])
    if invitation.destroy
      invitation.accept
      flash.now[:notice] = 'Invitation accepted!'
      render 'static_pages/dashboard'
    end
  end

  def destroy
    invitation = Invitation.find(params[:id])
    if invitation.destroy
      flash.now[:notice] = 'Invitation declined!'
      render 'static_pages/dashboard'
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:invite_email, :from_id, :to_id)
          .merge(team_id: params[:team_id])
  end

  def authenticate_recipient
    invitation = Invitation.find(params[:id])
    redirect_to dashboard_path unless invitation.to == current_user
  end
end
