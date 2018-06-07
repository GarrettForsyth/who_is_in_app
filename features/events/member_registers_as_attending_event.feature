Feature: a member registers as attending an event

  As a member
  I want to register as attending an event
  So my teammates can plan accordingly

  Scenario: currently registered as not attending an event
    Given I am signed in as a team member
    And my team has 1 upcoming event
    And I am marked as not attending
    When I access "my team's page"
    And I press "mark as attending"
    Then I should see "Registered as attending event."

  Scenario: currently registered as attending the event
    Given I am signed in as a team member
    And my team has 1 upcoming event
    When I access "my team's page"
    Then I should not see "mark as attending"

