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

Given("I am a member of a team") do
    @team = FactoryBot.create(:team)
    @team.add_member(@user)
end

