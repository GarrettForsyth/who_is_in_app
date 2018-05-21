Given("I am currently on my dashboard") do
  visit dashboard_path
end

Given("I currently have zero teams") do
  expect(@user.teams).to be_empty
end

When("I pick the minimum members to play to be {string}") do |num|
  fill_in 'team[min_members]', with: num.to_i
end

