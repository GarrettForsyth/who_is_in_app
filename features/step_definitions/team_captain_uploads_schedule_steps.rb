Given("I am captain of a team") do
  @team = FactoryBot.create(:team, captain: @user)
  expect(@user.captained_teams.any?).to eq(true)
end

Given("I am on my team's show page") do
  visit team_path(@team)
end

Given("there have been no emails sent by the server") do
  reset_emails
end

When("I select {string} from my documents") do |file_name|
  attach_file("Schedule", Rails.root +
              "spec/fixtures/#{file_name}")
end

Then("I should see the image {string}") do |image|
  expect(page).to have_xpath("//img[@src=\"/uploads/team/schedule/#{@team.id}/#{image}\"]")
end
