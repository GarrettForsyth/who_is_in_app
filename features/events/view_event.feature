Feature: a team member views an event's details

  As a team member
  I want to view an event's details
  So I can be better informed

  Scenario: both with members attending and not attending
    Given I am signed in as a team member
    And my team has 1 upcoming event
    And I am marked as not attending
    When I access "my team's page"
    And I follow 'details'
    Then I should see who is attending the event
    And I should see who is not attending the event
