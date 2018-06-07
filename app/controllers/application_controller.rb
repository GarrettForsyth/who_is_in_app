class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def authorizer(scope)
    client_id = Google::Auth::ClientId.new(
      ENV['GOOGLE_CLIENT_ID'],
      ENV['GOOGLE_CLIENT_SECRET']
    )
    token_store = Google::Auth::Stores::DatabaseTokenStore.new
    Google::Auth::WebUserAuthorizer.new(
      client_id,
      scope,
      token_store,
      user_google_oauth2_create_calendar_callback_path
    )
  end

  def credentials_for(scope)
    user_id = current_user.id
    credentials = authorizer(scope).get_credentials(user_id, request)
    if credentials.nil?
      redirect_to authorizer(scope).get_authorization_url(request: request)
    end
    credentials
  end

  def new_google_calendar
    client = Google::Apis::CalendarV3::CalendarService.new
    client.authorization = credentials_for(Google::Apis::CalendarV3::AUTH_CALENDAR)
    unless client.authorization.nil?
      calendar = Google::Apis::CalendarV3::Calendar.new(
        summary: 'test calendar'
      )
      @result = client.insert_calendar(calendar)
      flash[:notce] = 'Sucessfully created calendar.'
      redirect_to dashboard_path
    end
  end

  protected

  def authenticate_team_captain(team)
    redirect_back(fallback_location: dashboard_path) unless team.captain?(current_user)
  end

  def authenticate_team_member(team)
    redirect_back(fallback_location: dashboard_path) unless team.member?(current_user)
  end

  def authenticate_current_user(user)
    redirect_back(fallback_location: dashboard_path) unless user == current_user
  end

end
