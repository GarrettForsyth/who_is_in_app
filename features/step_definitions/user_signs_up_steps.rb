Given("the email {string} is already in use") do |email|
  FactoryBot.create(:user, email: email)
end
