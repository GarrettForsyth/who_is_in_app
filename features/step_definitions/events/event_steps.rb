Given('my team has {int} upcoming event(s)') do |num|
  @schedule ||= FactoryBot.create(:schedule, team: @team)
  now = DateTime.now
  num.times do |n|
    FactoryBot.create(:event,
                      schedule: @schedule,
                      start: now + (n+1) * 1.week, 
                      location: 'Ol Ball Field')
  end
end

Given("my team has {int} finished event(s)") do |num|
  @schedule ||= FactoryBot.create(:schedule, team: @team)
  now = DateTime.now
  num.times do |n|
    FactoryBot.create(:event,
                      schedule: @schedule,
                      start: now - (n+1) * 1.week, 
                      location: 'Ol Ball Field')
  end
end

Then('I should see the upcoming events') do
  @schedule.upcoming_events.each do |event|
    expect(page).to have_content(
      event.start.in_time_zone('Eastern Time (US & Canada)').strftime("%b %d %I:%M"))
  end
end

Then("I should not see finished events") do
  @schedule.finished_events.each do |event|
    expect(page).to_not have_content(
      event.start.in_time_zone('Eastern Time (US & Canada)').strftime("%b %d %I:%M"))
  end
end
