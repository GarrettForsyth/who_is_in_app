@wip
Feature: a team captain uploads a schedule

  As a team captain
  I want to upload a schedule
  So my teammates know about planned events

  Scenario:
    Given I have created and confirmed my account
    And I am signed in
    And I am captain of a team
    And I am on my team's show page
    When I follow "Upload Schedule"
    And I select "elephant-sunset.jpg" from my documents
    And I press "Update"
    Then I should see "Team information has been updated!"
    And I should see the image "elephant-sunset.jpg"
