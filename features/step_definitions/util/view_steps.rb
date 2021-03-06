Then('I should see {string}') do |string|
  expect(page).to have_content(string)
end

Then("I should see the image {string} if {string}") do |image, type|
  if type == 'image'
    expect(page).to have_xpath("//img[@src=\"/uploads/schedule/image/#{@team.schedule.id}/#{image}\"]")
  end
  if type == 'pdf'
    expect(page).to have_xpath("//iframe[@src=\"/uploads/schedule/image/#{@team.schedule.id}/#{image}\"]")
  end
end

Then("I should not see the image {string} if {string}") do |image, type|
  if type == 'image'
    expect(page).to_not have_xpath("//img[@src=\"/uploads/schedule/image/#{@team.schedule.id}/#{image}\"]")
  end
  if type == 'pdf'
    expect(page).to_not have_xpath("//iframe[@src=\"/uploads/schedule/image/#{@team.schedule.id}/#{image}\"]")
  end
end

Then("I should see {string} within {string}") do |string, container|
  within(:xpath, "//div[@class='#{container}']") do
  expect(page).to have_content(string)
  end
end

Then("I should not see {string}") do |button|
  expect(page).to_not have_selector(:link_or_button, button)
end
