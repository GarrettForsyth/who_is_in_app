@javascript
Feature: a team captain deletes a schedule

  As a team captain
  I want to delete a schedule
  Because it is no longer useful

  Scenario: team captain deletes team
    Given I am signed in as team captain
    And my team has a schedule
    When I access "my team's page"
    And I follow "edit schedule"
    And I press and confirm 'delete schedule'
    Then I should see 'Schedule deleted'
    And I should not see the image "<file name>" if "<file type>"
