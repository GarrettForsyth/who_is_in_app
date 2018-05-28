Feature: a team captain removes a team member
  As a team captain
  I want to remove a team member
  To more accurately reflect the current state of my team

  Scenario: valid user kicks a member 
    Given I am signed in as team captain
    When I access "my team's page"
    And I follow "roster"
    And beside my teammate's name I press "remove member"
    Then I should see "Member successfully removed"
    And I should not see my teammate's name

  Scenario: invalid user kicks a member
    Given I am signed in as a team member
    When I access "my team's page"
    And I follow "roster"
    Then I should not see "remove member" 
