# frozen_string_literal: true
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should also create an action method in this controller like this:
  # def twitter
  # end
  def google_oauth2
    @user = User.from_google_oauth2(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in @user
      set_flash_message(:notice, :success, kind: 'Google')
      redirect_to dashboard_path
    else
      session['devise.google_oauth2_data'] = request.env['omniauth.auth']
      flash[:notice] = "Access denied:\n #{@user.errors.full_messages.each { |msg| puts msg }} "
      redirect_to new_user_session_path
    end
  end

  def create_google_calendar
    if params[:code]
      authorizer(params[:scope]).get_and_store_credentials_from_code(
        user_id: current_user.id,
        code: params[:code],
        scope: params[:scope],
        base_url: request.url
      )
      # update user's scopes if accapted
      #current_user.update_attribute(:scope, params[:scope])
      new_google_calendar
    else 
      flash[:notice] = 'Could not create calendar: Permission deined.'
      redirect_to dashboard_path
    end
  end


  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
