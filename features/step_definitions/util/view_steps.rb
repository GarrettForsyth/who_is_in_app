Then('I should see {string}') do |string|
  expect(page).to have_content(string)
end

Then("I should see the image {string} if {string}") do |image, type|
  if type == 'image'
    expect(page).to have_xpath("//img[@src=\"/uploads/team/schedule/#{@team.id}/#{image}\"]")
  end
  if type == 'pdf'
    expect(page).to have_xpath("//iframe[@src=\"/uploads/team/schedule/#{@team.id}/#{image}\"]")
  end
end
