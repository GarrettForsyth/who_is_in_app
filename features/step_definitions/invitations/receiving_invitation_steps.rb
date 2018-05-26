Given("I have been sent an invitation") do
  @captain = FactoryBot.create(:user)
  @team = FactoryBot.create(:team, captain: @captain)
  @invitation = FactoryBot.create(:invitation,
                                 to: @user,
                                 from: @captain,
                                 team: @team)
end
