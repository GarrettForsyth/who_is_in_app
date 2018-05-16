Given("I have created and confirmed my account") do
  @user = FactoryBot.create(:user)
end

Given("I am signed in") do
  visit new_user_session_path
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Log in'
end

Given("I am currently on my dashboard") do
  visit dashboard_path
end

Given("I currently have zero teams") do
  expect(@user.teams).to be_empty
end

When("I fill_in {string} with {string}") do |label, value|
  fill_in label, with: value
end

When("I select {string}") do |activity|
  choose activity unless activity.blank?
end

When("I pick the minimum members to play to be {string}") do |num|
  fill_in 'team[min_members]', with: num.to_i
end

Then("I should be redirected to my teams page") do
  team = @user.teams.first
  expect(page).to have_current_path(team_path(team))
end
