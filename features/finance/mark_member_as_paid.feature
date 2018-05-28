Feature: team captain marks a member as having paid

  As a team captain
  I want to mark a member as having paid
  So I can keep track of who owes me money

  Scenario: valid user marks a member as paid
    Given I am signed in as team captain
    When I access "my team's page"
    And I follow 'roster'
    And beside my teammate's name I press "mark as paid"
    Then my teammates name should be green

  Scenario: a valid user marks a member as upaid
    Given I am signed in as team captain
    And my teammate is currently marked as paid
    When I access "my team's page"
    And I follow 'roster'
    And beside my teammate's name I press "mark as not paid"
    Then my teammates name should be red

  Scenario: an invalid user marks a member as paid
    Given I am signed in as a team member 
    When I access "my team's page"
    And I follow 'roster'
    Then I should not see 'mark as paid'
    And I should not see the paid status of my teammates
