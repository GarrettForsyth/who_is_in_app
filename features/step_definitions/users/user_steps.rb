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

Given("I have an account with Google associated with the email {string}") do |email|
  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
    provider: 'google_oauth2',
    uid: '123545',
    info: {
      name: 'Mock Name (omniauth)',
      email: email
    },
    credentials: {
      token: 'mock_token',
      expires: true,
      expires_at: 100_000,
      refresh_token: 'mock_refresh_token'
    }
  )
end

When("I confirm my current password") do
  fill_in 'Current password', with: @user.password
end

When("I sign in") do
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Log in'
end
