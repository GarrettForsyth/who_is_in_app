Given("I am captain of a team") do
  @team = FactoryBot.create(:team, captain: @user)
  expect(@user.captained_teams.any?).to eq(true)
end
