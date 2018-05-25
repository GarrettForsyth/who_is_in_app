Given("I have created and confirmed my account") do
  @user = FactoryBot.create(:user)
end

Given("I am signed in") do
  @user = @user || FactoryBot.create(:user) 
  sign_in(@user)
end

Given("the email {string} is already in use") do |email|
  FactoryBot.create(:user, email: email)
end
