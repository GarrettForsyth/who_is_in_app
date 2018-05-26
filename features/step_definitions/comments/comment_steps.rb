Given("a team member has commented on my message") do
  @comment = FactoryBot.create(:comment, author: @teammate, message: @message)
end

Then("I should see my comment's content") do
  expect(page).to have_content(@message.comments.last.content)
end

Then("I should not see the comment's content") do
  expect(page).to_not have_content(@comment.content)
end
