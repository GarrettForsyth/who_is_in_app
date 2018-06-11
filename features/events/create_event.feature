Feature: a team captain adds an event to their schedule

  As a team captain
  I want to add events to my team's schedule
  So my teammates are aware of them

  Scenario: creating a schedule with events 
    Given I am signed in as team captain
    And my team has a schedule
    When I access "my team's page"
    And I follow "edit schedule"
    And I follow "add event"
    And I fill in "Start" with "2018/01/01"
    And I fill in "Location" with "The ol Ball Field"
    And I press 'submit'
    Then I should see "Event successfully created"
    And I should be routed to "my team's page"
