Feature: a team member sees upcoming events

  As a team member
  I want to see upcoming events
  So I can plan for them

  Scenario: normal flow
    Given I am signed in as a team member
    And my team has a schedule
    And my team has 3 upcoming events
    And my team has 1 finished event
    When I access "my team's page"
    Then I should see the upcoming events
    And I should not see finished events
