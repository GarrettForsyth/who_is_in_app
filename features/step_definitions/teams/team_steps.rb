ParameterType(
  name: 'min members',
  regexp: /min members (-?\d+)?/,
  transformer: ->(num = nil) { num.nil? ? '' : num.to_i }
)

Given('I currently have zero teams') do
  expect(@user.teams).to be_empty
end

Given('I am not a member of the team') do
  expect(@team.members).to_not include(@user)
end

Given('there is an existing team') do
  @team = FactoryBot.create(:team)
end

Given('I am captain of a team') do
  @team = FactoryBot.create(:team, captain: @user)
end

Given('I am a member of a team') do
  @team = FactoryBot.create(:team)
  @team.add_member(@user)
end

Given('I have a teammate') do
  @teammate = FactoryBot.create(:user)
  @user.teams.first.add_member(@teammate)
end

Given('I have {int} teammates') do |num|
  num.times do
    @teammate = FactoryBot.create(:user)
    @user.teams.first.add_member(@teammate)
  end
end

When("I follow my team's link") do
  click_link @team.name
end

Then('I should see my/the team( name)') do
  expect(page).to have_content(@team.name, count: 1)
end

Then('I should not see my/the team( name)') do
  expect(page).to_not have_content(@team.name)
end
