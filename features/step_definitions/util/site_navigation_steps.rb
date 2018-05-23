World(Devise::TestHelpers)

Given("I am on {string}") do |location|
  visit path_to(location)
end

When('I follow {string}') do |link|
  click_link link
end

When('I access {string}') do |location|
  visit path_to(location)
end

Then('I should be routed to {string}') do |location|
    expect(page).to have_current_path(path_to(location))
end

Then("I should be redirected to my teams page") do
  team = @user.teams.first
  expect(page).to have_current_path(team_path(team))
end

Then("I should not be logged in") do
  visit dashboard_path
  expect(current_path).to eq(new_user_session_path) 
end

