Given("I have created and confirmed my account") do
  @user = FactoryBot.create(:user)
end

Given("I am signed in") do
  visit new_user_session_path
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Log in'
end

Given("I am currently {string}") do |role|
  case role

  when "logged in"
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

  end

end
