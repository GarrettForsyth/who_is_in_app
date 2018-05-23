Given("I have posted a message") do
  @message = FactoryBot.create(:message, author: @user, team: @team)
end

Given("my teammate has posted a message") do
  @message = FactoryBot.create(:message, author: @teammate, team: @teammate.teams.first)
end

Then("I should not see the message's content") do
  expect(page).to_not have_content(@message.content)
end

