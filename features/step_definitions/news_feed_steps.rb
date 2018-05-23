Given("I have posted a message") do
  @message = FactoryBot.create(:message, author: @user, team: @team)
end

Given("my teammate has posted a message") do
  @message = FactoryBot.create(:message, author: @teammate, team: @teammate.teams.first)
end

Given("a team member has commented on my message") do
  @comment = FactoryBot.create(:comment, author: @user, message: @message)
  @message.comments << @comment
end

Then("I should not see the message's content") do
  expect(page).to_not have_content(@message.content)
end

Then("I should see my comment's content") do
  expect(page).to have_content(@message.comments.last.content)
end

Then("I should not see the comment's content") do
  expect(page).to_not have_content(@comment.content)
end
