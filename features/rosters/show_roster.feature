Feature: a user views a team's roster

  As a user
  I want to view a team's roster
  To see who is currently on the team

Scenario: user visits roster after creating team
    Given I am signed in
    And I am on "my dashboard"
    When I follow "Create New Team"
    And I fill in "Name" with "Blue Jays"
    And I select "Baseball"
    And I fill in "Minimum members needed for an event" with min members 10
    And I press "submit"
    And I follow 'roster'
    Then I should see my name
    And I should see my emails

Scenario: a valid user
    Given I am signed in as a team member
    And I have 10 teammates
    When I access "my team's page"
    And I follow "roster"
    Then I should see my teammate's names
    And I should see my teammate's emails

Scenario: invalid user
    Given I am signed in 
    And there is an existing team
    When I access "the team's roster path"
    Then I should be routed to "my dashboard"
