@wip
Feature: a user creates a team

  As a user
  I want to create a team
  So I can communicate better with my teammates

  Scenario:
    Given I have created and confirmed my account
    And I am signed in
    And I am currently on my dashboard
    And I currently have zero teams
    When I follow "Create New Team"
    And I fill_in "Name" with "The Mighty Ducks"
    And I select "Hockey"
    And I pick the minimum players to play to be 6
    And I press "Create Team"
    Then I should be redirected to my teams page 
    And I should see "The Mighty Ducks"
    And I should see "Hockey"
