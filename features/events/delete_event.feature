@javascript
Feature: a team captain deletes an event

  As a captain
  I want to delete an event
  Because it is no longer relevant

  Scenario: captain deletes event
    Given I am signed in as team captain
    And my team has 1 upcoming event
    When I access "my team's page"
    And I press and confirm 'delete event'
    Then I should see 'Event deleted'

  Scenario: invalid user
    Given I am signed in as a team member
    And my team has 1 upcoming event
    When I access "my team's page"
    Then I should not see 'delete event'


