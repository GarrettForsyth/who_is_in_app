@javascript
Feature: a team captain deletes a team

  As a team captain
  I want to delete my team
  because it is no longer relevant


  Scenario: a team capttain deletes a team
    Given I am signed in as team captain
    And I am on "my dashboard"
    When I follow my team's link
    And I follow 'Edit Team Information'
    And I press and confirm 'delete team'
    Then I should see "Team deleted!"
    And I should not see my team
