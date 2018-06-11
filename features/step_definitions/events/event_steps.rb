Given('my team has {int} upcoming event(s)') do |num|
  @schedule ||= FactoryBot.create(:schedule, team: @team)
  now = DateTime.now
  num.times do |n|
  @events = FactoryBot.create(:event,
                      schedule: @schedule,
                      start: now + (n+1) * 1.week, 
                      location: 'Ol Ball Field')
  end
end

Given("my team has {int} finished event(s)") do |num|
  @schedule ||= FactoryBot.create(:schedule, team: @team)
  now = DateTime.now
  num.times do |n|
  @events = FactoryBot.create(:event,
                      schedule: @schedule,
                      start: now - (n+1) * 1.week, 
                      location: 'Ol Ball Field')
  end
end

Given("I am marked as not attending") do
  @events.attending.delete(@user)
end


Then('I should see the upcoming events') do
  @schedule.upcoming_events.each do |event|
    expect(page).to have_content(
      event.start.strftime("%b %d %I:%M"))
  end
end

Then("I should not see finished events") do
  @schedule.finished_events.each do |event|
    expect(page).to_not have_content(
      event.start.strftime("%b %d %I:%M"))
  end
end

Then("I should see who is attending the event") do
  @events.attending.each do |attendee|
    within(:xpath, "//ul[@class='attendance attending']") do
      expect(page).to have_content(attendee.name)
    end
  end
end

Then("I should see who is not attending the event") do
  @events.schedule.team.members do |member|
    unless event.attending.include?(member)
      within(:xpath, "//div[@class='not-attending']") do
        expect(page).to have_content(attendee.name)
      end
    end
  end
end
