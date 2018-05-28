Then("I should see my( teammate's) name(s)") do
  @user.teams.first.members.each do |member|
    expect(page).to have_content(member.name)
  end
end

Then("I should see my( teammate's) email(s)") do
  @user.teams.first.members.each do |member|
    expect(page).to have_content(member.email)
  end
end
