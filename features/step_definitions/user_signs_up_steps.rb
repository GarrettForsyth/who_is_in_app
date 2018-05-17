Given('I am on the home page') do
  visit root_path
  expect(page).to have_current_path(root_path)
end

Given("the email {string} is already in use") do |email|
  FactoryBot.create(:user, email: email)
end


When('I follow {string}') do |link|
  click_link link
end

Then('I should see {string}') do |string|
  expect(page).to have_content(string)
end

When('I fill in {string} with {string}') do |label, value|
  fill_in label, with: value
end

When('I press {string}') do |btn_text|
  click_button btn_text
end

Then('I should see content that includes {string}') do |content|
  expect(page).to have_content(content)
end

Then('I should be on {string}') do |expected_page|
  expect(page).to have_current_path(eval(expected_page))
end

Then("{string} emails have been sent") do |expected_num_emails|
  expect(num_emails).to eq(expected_num_emails.to_i)
end

Then("if an email was sent, it was addressed to {string}") do |user_email|
  expect(last_email.to_s).to include(user_email) unless num_emails.zero?
end

