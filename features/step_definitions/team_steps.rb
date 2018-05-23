Given("there is a team created by {string}") do |owner|
  case owner
  when /private user/
    @team = FactoryBot.create(:team)

  when /me/
    @team = FactoryBot.create(:team, captain: @user)

  when /my teammate/
    @team = FactoryBot.create(:team)
    @team.add_member(@user)
  end
end

Given("I am a captain of a team") do
    @team = FactoryBot.create(:team, captain: @user)
end

Given("I am a member of a team") do
    @team = FactoryBot.create(:team)
    @team.add_member(@user)
end

Given("I have a teammate") do
  @teammate = FactoryBot.create(:user)
  @user.teams.first.members << @teammate
end

