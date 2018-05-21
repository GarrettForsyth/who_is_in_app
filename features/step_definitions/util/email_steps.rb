Then("{string} emails have been sent") do |expected_num_emails|
  expect(num_emails).to eq(expected_num_emails.to_i)
end

Then("if an email was sent, it was addressed to {string}") do |user_email|
  expect(last_email.to_s).to include(user_email) unless num_emails.zero?
end

Given("there have been no emails sent by the server") do
  reset_emails
end
