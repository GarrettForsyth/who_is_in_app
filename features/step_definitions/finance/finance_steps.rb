Given('my teammate is currently marked as paid') do
  f = @teammate.finance_for(@team)
  f.paid = true
  f.save
end

Then('my teammates name should be red') do
  expect(page).to have_css("//div[@id='uid_#{@teammate.id}'][@class='roster-entry not-paid']")
end

When("beside my teammate's name I press {string}") do |button|
  within("//div[@id='uid_#{@teammate.id}']") do
    click_button button
  end
end

Then('my teammates name should be green') do
  expect(page).to have_css("//div[@id='uid_#{@teammate.id}'][@class='roster-entry paid']")
end

Then('I should not see the paid status of my teammates') do
  expect(page).to_not have_css("//div[@class='roster-entry paid']")
  expect(page).to_not have_css("//div[@class='roster-entry not-paid']")
end
