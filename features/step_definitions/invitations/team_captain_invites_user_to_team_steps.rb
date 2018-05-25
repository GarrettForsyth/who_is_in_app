Given("there is another user, currently not on my team") do
  @user2 = FactoryBot.create(:user)
end

When("I fill in {string} with the user's email") do |label|
  fill_in label, with: @user2.email
end

When("the invited user signs in") do
  # first sign out of the first user for testing purposes
  click_link 'sign out'
  visit new_user_session_path
  sign_in(@user2)
end

When("the invited user visits {string}") do |team|
  visit path_to(team)
end

When("the invited user presses {string}") do |button|
  click_button button
end

Then("he should be on {string}") do |path|
  expect(current_path).to eq(path_to(path))
end


