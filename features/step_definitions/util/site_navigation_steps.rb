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
