module NavigationHelpers
  def path_to(page_name)
    case page_name
    when /my dashboard/
      dashboard_path
    when /the home page/
      root_path
    when /team's page/
      team_path(@team)
    when /team's edit page/
      edit_team_path(@team)
    when /sign in/
      new_user_session_path
    end
  end
end
World(NavigationHelpers)
