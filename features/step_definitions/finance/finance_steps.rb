Given('my teammate is currently marked as paid') do
  f = @teammate.finance_for(@team)
  f.paid = true
  f.save
end

When("beside my teammate's name I press {string}") do |button|
  within("//tr[@id='uid_#{@teammate.id}']") do
    click_button button
  end
end

Then('my teammates name should be red') do
  expect(page).to have_css("//tr[@id='uid_#{@teammate.id}'][@class='roster-entry not-paid']")
end


Then('my teammates name should be green') do
  expect(page).to have_css("//tr[@id='uid_#{@teammate.id}'][@class='roster-entry paid']")
end

Then('I should not see the paid status of my teammates') do
  expect(page).to_not have_css("//div[@class='roster-entry paid']")
  expect(page).to_not have_css("//div[@class='roster-entry not-paid']")
end

Then("I should not see {string} beside my name") do |string|
  within("//tr[@id='uid_#{@user.id}']") do
    expect(page).to_not have_selector(:link_or_button, 'remove member')
  end
end
