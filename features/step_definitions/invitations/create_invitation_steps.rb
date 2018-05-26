Given("there is another user, currently not on my team") do
  @user2 = FactoryBot.create(:user)
end

Given("I have already sent this user an invitation") do
  @invitation = FactoryBot.create(:invitation, to: @user2, from: @user, team: @user.teams.first)
end

When("I fill in {string} with the user's email") do |label|
  fill_in label, with: @user2.email
end

When("I fill in {string} with my teammate's email") do |label|
  fill_in label, with: @teammate.email
end
