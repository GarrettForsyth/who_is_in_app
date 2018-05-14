Given('my email has not been used to sign up before') do
  expect(User.find_by(email: 'bark@dog.com')).to be_nil
end

Given('I am on the home page') do
  visit root_path
  expect(page).to have_current_path(root_path)
end

When('I follow {string}') do |link|
  click_link link
end

When('I fill in {string} with {string}') do |label, value|
  fill_in label, with: value
end

When('I press {string}') do |string|
  click_button 'Sign up'
end

Then('I should see {string}') do |string|
  expect(page).to have_content(string)
end

Then('I should be on the login path') do
  expect(page).to have_current_path(new_user_session_path)
end

Then('I should be listed as a user') do
  expect(User.find_by(email: 'bark@dog.com')).to_not be_nil
end
