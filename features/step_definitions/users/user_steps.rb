Given("I have created and confirmed my account") do
  @user = FactoryBot.create(:user)
end

Given("I am signed in") do
  @user = FactoryBot.create(:user) 
  sign_in(@user)
end

Given("I am signed in as team captain") do
  @user = FactoryBot.create(:user)
  @teammate = FactoryBot.create(:user)
  @team = FactoryBot.create(:team, captain: @user)
  @team.add_member(@teammate)
  sign_in(@user)
end

Given("I am signed in as a team member") do
  @teammate = FactoryBot.create(:user)
  @team = FactoryBot.create(:team, captain: @teammate)
  @user = FactoryBot.create(:user)
  @team.add_member(@user)
  sign_in(@user)
end


Given("the email {string} is already in use") do |email|
  FactoryBot.create(:user, email: email)
end

When("I confirm my current password") do
  fill_in 'Current password', with: @user.password
end

When("I sign in") do
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Log in'
end
