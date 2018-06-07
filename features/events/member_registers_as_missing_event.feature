Feature: a member notifies they will miss an event

  As a member
  I want to register as missing an event
  So my teammates can plan for me not being there

  Scenario: currently marked as attending
    Given I am signed in as a team member
    And my team has 1 upcoming event
    When I access "my team's page"
    And I press 'mark as not attending'
    Then I should see "Registered as not attending event."

  Scenario: currently marked as not attending
    Given I am signed in as a team member
    And my team has 1 upcoming event
    And I am marked as not attending
    When I access "my team's page"
    Then I should not see 'mark as not attending'
